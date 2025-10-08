return {
  { "nvim-mini/mini.pairs", enabled = false },
  { "folke/ts-comments.nvim", enabled = false },
  { "folke/todo-comments", enabled = false },
  { "folke/noice.nvim", enabled = false },
  { "windwp/nvim-ts-autotag", enabled = false },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },

  {
    "snacks.nvim",
    opts = {
      dashboard = { enabled = false },
      notifier = { enabled = false },
      scroll = { enabled = false },
    },
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    lazy = false,
    opts = function()
      -- Auto-restore last session on startup
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          local persistence = require("persistence")
          if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
            persistence.load()
          end
        end,
        nested = true,
        once = true,
      })
    end,
  },
}
