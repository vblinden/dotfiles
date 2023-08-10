vim.opt.scrolloff = 12
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.scrolloff = 8

vim.api.nvim_create_user_command('Rfinder',
    function()
        local path = vim.api.nvim_buf_get_name(0)
        os.execute('open -R ' .. path)
    end,
    {}
)

return {}
