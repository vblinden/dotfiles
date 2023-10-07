-- Tabs
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.wrap = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.breakindent = true
vim.opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
vim.opt.linebreak = true

vim.opt.foldmethod = "marker"
vim.opt.foldlevel = 0
vim.opt.modelines = 1

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.scrolloff = 8

vim.opt.cursorline = true -- Highlight line
-- vim.opt.smoothscroll = true

vim.api.nvim_create_user_command('Finder',
    function()
        local path = vim.api.nvim_buf_get_name(0)
        os.execute('open -R ' .. path)
    end,
    {}
)

return {}
