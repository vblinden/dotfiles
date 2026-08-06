-- LSP Plugins
return {
	{
		-- Main LSP Configuration
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			-- Mason must be loaded before its dependents so we need to set it up here.
			{ "mason-org/mason.nvim", opts = {} },
			-- Translates between nvim-lspconfig server names and mason package names
			{
				"mason-org/mason-lspconfig.nvim",
				opts = {
					-- We enable servers ourselves via vim.lsp.enable below
					automatic_enable = false,
				},
			},
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful status updates for LSP.
			{ "j-hui/fidget.nvim", opts = {} },

			-- blink.cmp extends LSP capabilities itself; listed so it loads first
			"saghen/blink.cmp",
		},
		config = function()
			-- This function gets run when an LSP attaches to a particular buffer.
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					-- Helper to define buffer-local LSP mappings
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					local fzf = require("fzf-lua")

					-- Neovim-style LSP mappings (gr*) with fzf-lua pickers
					-- Rename the variable under your cursor.
					map("grn", vim.lsp.buf.rename, "[R]e[n]ame")

					-- Execute a code action
					map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })

					-- Find references for the word under your cursor.
					map("grr", fzf.lsp_references, "[G]oto [R]eferences")

					-- Jump to the implementation of the word under your cursor.
					map("gri", fzf.lsp_implementations, "[G]oto [I]mplementation")

					-- Jump to the definition of the word under your cursor.
					-- To jump back, press <C-t>.
					map("grd", fzf.lsp_definitions, "[G]oto [D]efinition")
					-- Keep gd as a common alias
					map("gd", fzf.lsp_definitions, "[G]oto [D]efinition")

					-- Jump to the type of the word under your cursor.
					map("grt", fzf.lsp_typedefs, "[G]oto [T]ype Definition")

					-- WARN: This is not Goto Definition, this is Goto Declaration.
					map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					-- Fuzzy find all the symbols in your current document.
					map("gO", fzf.lsp_document_symbols, "Open Document Symbols")

					-- Fuzzy find all the symbols in your current workspace.
					map("gW", fzf.lsp_live_workspace_symbols, "Open Workspace Symbols")

					-- Hover documentation
					map("K", function()
						vim.lsp.buf.hover({ border = "rounded" })
					end, "Hover Documentation")

					-- Highlight references of the word under your cursor on CursorHold.
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client:supports_method("textDocument/documentHighlight", event.buf) then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					-- Toggle inlay hints if the language server supports them
					if client and client:supports_method("textDocument/inlayHint", event.buf) then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			-- Enable the following language servers
			-- Feel free to add/remove any LSPs that you want here. They will automatically be installed.
			-- See `:help lsp-config` for information about keys and how to configure
			---@type table<string, vim.lsp.Config>
			local servers = {
				-- clangd = {},
				-- pyright = {},
				-- rust_analyzer = {},
				gopls = {},
				templ = {},
				ts_ls = {},
				html = { filetypes = { "html", "twig", "hbs" } },
				intelephense = {},

				-- Special Lua config, as recommended by neovim help docs
				lua_ls = {
					on_init = function(client)
						-- Formatting is handled by stylua via conform
						client.server_capabilities.documentFormattingProvider = false

						if client.workspace_folders then
							local path = client.workspace_folders[1].name
							if
								path ~= vim.fn.stdpath("config")
								and (
									vim.uv.fs_stat(path .. "/.luarc.json")
									or vim.uv.fs_stat(path .. "/.luarc.jsonc")
								)
							then
								return
							end
						end

						local current_settings = client.config.settings
						client.config.settings.Lua = vim.tbl_deep_extend("force", current_settings.Lua or {}, {
							runtime = {
								version = "LuaJIT",
								path = { "lua/?.lua", "lua/?/init.lua" },
							},
							workspace = {
								checkThirdParty = false,
								-- NOTE: this is a lot slower and will cause issues when working on your own configuration.
								-- See https://github.com/neovim/nvim-lspconfig/issues/3189
								library = vim.tbl_extend("force", vim.api.nvim_get_runtime_file("", true), {
									"${3rd}/luv/library",
									"${3rd}/busted/library",
								}),
							},
						})
					end,
					settings = {
						Lua = {
							format = { enable = false },
						},
					},
				},
			}

			-- Ensure the servers and tools above are installed
			-- To check status / install manually: :Mason  (press g? for help)
			local ensure_installed = vim.tbl_keys(servers)
			-- Map LSP names that differ from Mason package names
			local mason_name = {
				ts_ls = "typescript-language-server",
				html = "html-lsp",
				lua_ls = "lua-language-server",
			}
			for i, name in ipairs(ensure_installed) do
				ensure_installed[i] = mason_name[name] or name
			end
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
			})

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			-- blink.cmp registers LSP capabilities itself — no manual merge needed
			for name, server in pairs(servers) do
				vim.lsp.config(name, server)
				vim.lsp.enable(name)
			end
		end,
	},
}
