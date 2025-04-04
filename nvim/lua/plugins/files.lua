vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open tree' })

return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      watch_for_changes = true,
    }
  end,
}
