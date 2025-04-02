-- Keymaps for better default experience
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>ke", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics [Q]uickfix list" })

-- Easy exit out of terminal mode
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Esc, esc exits terminal mode" })

-- Disable arrow keys in normal mode, force to use hjkl
vim.keymap.set("n", "<left>", '<cmd>echo "Please use H to move"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Please use L to move"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Please use K to move"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Please use J to move"<CR>')

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Git diff
vim.keymap.set("n", "gh", "<cmd>diffget //2<cr>", { desc = "Get the hunk in the left" })
vim.keymap.set("n", "gl", "<cmd>diffget //3<cr>", { desc = "Get the hunk in the right" })
