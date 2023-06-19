-- Neotree keymappings
vim.keymap.set('n', '<leader>kt', ':Neotree source=filesystem toggle position=right<cr>', { desc = 'Toggle [T]ree' })
vim.keymap.set('n', '<leader>ktr', ':Neotree reveal<cr>', { desc = '[T]ree [R]eveal File' })

-- General keymaps
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

return {}
