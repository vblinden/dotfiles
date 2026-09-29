-- GrokNight — dark colorscheme. Highlights live in lua/grok/theme.lua.
vim.o.termguicolors = true
vim.g.colors_name = "groknight"
vim.o.background = "dark"
require("grok.theme").apply("dark")
