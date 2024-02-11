-- Neotree keymappings
vim.keymap.set('n', '<leader>kt', ':Neotree source=filesystem toggle position=right<cr>', { desc = 'Toggle [T]ree' })
vim.keymap.set('n', '<leader>ktr', ':Neotree reveal position=right<cr>', { desc = '[T]ree [R]eveal File' })

-- Persistence keymappings
vim.api.nvim_set_keymap("n", "<leader>rs", [[<cmd>lua require("persistence").load()<cr>]], { desc = '[R]estore [S]ession' })

-- vim.keymap.set("x", "<leader>p", [["_dP]])

-- General keymaps
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- When combining line, let cursor alone
vim.keymap.set('n', 'J', 'mzJ`z')

-- Move selection up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Telescope keymaps
vim.keymap.set('n', '<leader>si', ':Telescope find_files hidden=true no_ignore=true<cr>', { desc = '[S]earch [I]nvisible' })
-- vim.keymap.set('n', '<leader>gi', ':Telescope live_grep hidden=true no_ignore=true<cr>', { desc = '[G]rep [I]nvisible' })
-- vim.keymap.set("n", "<leader>gi", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = '[G]rep [I]nvisible' })

return {}
