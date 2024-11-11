return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettierd", "prettier", stop_after_first = false },
      typescript = { "prettierd", "prettier", stop_after_first = false },
      php = { "php-cs-fixer", "pint", "phpcbf", stop_after_first = true },
      blade = { "blade-formatter" },
      twig = { "twig-cs-fixer" },
      markdown = { "markdownlint" },
    },
  },
}
