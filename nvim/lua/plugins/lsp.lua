return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Additional lua configuration, makes nvim stuff amazing!
		"folke/neodev.nvim",

		-- Useful status updates for LSP
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		require("neodev").setup()

		--  This function gets run when an LSP connects to a particular buffer.
		local on_attach = function(_, bufnr)
			local nmap = function(keys, func, desc)
				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
			end

			-- Important LSP Navigation keybinds
			--
			-- Jump to the definition of the word under your cursor.
			--  To jump back, press <C-T>.
			nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
			nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
			nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
			nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
			nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
			nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

			-- NOTE: This is not Goto Definition, this is Goto Declaration.
			--  For example, in C this would take you to the header
			nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

			-- Rename the variable under your cursor
			nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

			-- Execute a code action, usually your cursor needs to be on top of an error
			-- or a suggestion from your LSP for this to activate.
			nmap("<leader>ca", function()
				vim.lsp.buf.code_action({ context = { only = { "quickfix", "refactor", "source" } } })
			end, "[C]ode [A]ction")

			-- See `:help K` for why this keymap
			nmap("K", vim.lsp.buf.hover, "Hover Documentation")

			-- Show the signature of the function you're currently completing.
			nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

			-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			-- 	buffer = event.buf,
			-- 	callback = vim.lsp.buf.document_highlight,
			-- })
			--
			-- vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			-- 	buffer = event.buf,
			-- 	callback = vim.lsp.buf.clear_references,
			-- })
		end

		-- LSP servers and clients are able to communicate to each other what features they support.
		--  By default, Neovim doesn't support everything that is in the LSP Specification.
		--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
		--  So, we create new capabilties with nvim cmp, and then broadcast that to the servers.
		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

		-- Enable the following language servers
		--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
		--
		--  Add any additional override configuration in the following tables. Available keys are:
		--  - cmd (table): Override the default command used to start the server
		--  - filetypes (table): Override the default list of associated filetypes for the server
		--  - capabilities (table): TODO
		--  - settings (table): Override the default settings passed when initializing the server.
		--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
		local servers = {
			-- clangd = {},
			gopls = {},
			-- pyright = {},
			-- rust_analyzer = {},
			ts_ls = {},
			html = { filetypes = { "html", "twig", "hbs" } },
			intelephense = {},

			lua_ls = {
				-- cmd = {...},
				-- filetypes { ...},
				-- capabilities = {},
				settings = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
						-- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
						-- diagnostics = { disable = { 'missing-fields' } },
					},
				},
			},
		}

		-- Ensure the servers above are installed
		require("mason").setup()

		-- TODO: Think about lspconfig mason
		local installed = { "stylua" }
		vim.list_extend(installed, vim.tbl_keys(servers))
		require("mason-tool-installer").setup({ ensure_installed = installed })
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					require("lspconfig")[server_name].setup({
						cmd = server.cmd,
						settings = server.settings,
						filetypes = server.filetypes,
						on_attach = on_attach,
						-- TODO: Think about what we wanna do here.
						-- capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities),
						capabilities = server.capabilities or capabilities,
					})
				end,
			},
		})
	end,
}
