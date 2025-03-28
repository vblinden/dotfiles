-- Enable and disable formatting at will
vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	opts = {
		format_on_save = function(bufnr)
			-- Disable with a global or buffer-local variable
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { timeout_ms = 1500, lsp_fallback = true }
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			css = { "css_beautify" },
			javascript = { "prettierd", "prettier", stop_after_first = false },
			javascriptreact = { "prettierd", "prettier", stop_after_first = false },
			typescript = { "prettierd", "prettier", stop_after_first = false },
			typescriptreact = { "prettierd", "prettier", stop_after_first = false },
			php = { "pint", "php_cs_fixer", "phpcbf", stop_after_first = false },
			blade = { "blade-formatter" },
			twig = { "twig-cs-fixer" },
			markdown = { "markdownlint" },
		},
	},
}
