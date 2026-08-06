-- [[ Configure Treesitter ]]
-- Used to highlight, edit, and navigate code
-- See `:help nvim-treesitter-intro`
--
-- nvim-treesitter (main) compiles parsers with the `tree-sitter` CLI.
-- Installs must not block the UI: never call :wait(), and avoid concurrent
-- install of the same language (that path uses a blocking vim.wait).

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")

			-- Core parsers + languages used often in this setup
			local ensure = {
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
				"php",
				"javascript",
				"typescript",
				"tsx",
				"go",
				"json",
				"yaml",
				"toml",
				"css",
			}

			---@param buf integer
			---@param language string
			local function treesitter_try_attach(buf, language)
				if not vim.api.nvim_buf_is_valid(buf) then
					return
				end

				local ok, added = pcall(vim.treesitter.language.add, language)
				if not ok or added == false then
					return
				end

				pcall(vim.treesitter.start, buf, language)

				local has_indent_query = pcall(function()
					return vim.treesitter.query.get(language, "indents") ~= nil
				end) and vim.treesitter.query.get(language, "indents") ~= nil

				if has_indent_query then
					vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end

			-- Track in-flight installs so we never re-enter the blocking wait path
			local installing = {} ---@type table<string, boolean>

			---@param buf integer
			---@param language string
			local function ensure_and_attach(buf, language)
				local installed = ts.get_installed("parsers")
				if vim.tbl_contains(installed, language) then
					treesitter_try_attach(buf, language)
					return
				end

				-- Already compiling this language — attach later isn't critical
				if installing[language] then
					return
				end

				local available = ts.get_available()
				if not vim.tbl_contains(available, language) then
					-- Might still work if parser exists outside nvim-treesitter
					treesitter_try_attach(buf, language)
					return
				end

				installing[language] = true
				ts.install(language):await(function()
					installing[language] = nil
					treesitter_try_attach(buf, language)
				end)
			end

			-- Attach as filetypes open (install missing in background only)
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("kickstart-treesitter", { clear = true }),
				callback = function(args)
					local language = vim.treesitter.language.get_lang(args.match)
					if language then
						ensure_and_attach(args.buf, language)
					end
				end,
			})

			-- Prefetch curated parsers after UI is ready (async, limited concurrency)
			vim.api.nvim_create_autocmd("VimEnter", {
				group = vim.api.nvim_create_augroup("kickstart-treesitter-prefetch", { clear = true }),
				once = true,
				callback = function()
					vim.schedule(function()
						if vim.fn.executable("tree-sitter") == 0 then
							vim.notify(
								"tree-sitter CLI not found — parsers won't compile. Install with: brew install tree-sitter",
								vim.log.levels.WARN,
								{ title = "nvim-treesitter" }
							)
							return
						end

						local installed = ts.get_installed("parsers")
						local missing = vim.tbl_filter(function(lang)
							return not vim.tbl_contains(installed, lang)
						end, ensure)

						if #missing == 0 then
							return
						end

						-- Low concurrency keeps UI responsive during compile
						ts.install(missing, { max_jobs = 2, summary = true })
					end)
				end,
			})
		end,
	},
}
