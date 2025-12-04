vim.g.snacks_animate = false

local opt = vim.opt

opt.confirm = false -- Don't confirm when exiting modified buffer
opt.scrolloff = 9
opt.sidescrolloff = 9
opt.smoothscroll = false
opt.relativenumber = false

opt.spelllang = { "en", "nl" }

vim.g.lazyvim_php_lsp = "intelephense"
