vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp" },
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.smartindent = true
    end,
})
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function(data)

        local api = require("nvim-tree.api")

        -- nvim 无参数
        if vim.fn.argc() == 0 then
            api.tree.open()
            return
        end

        -- nvim 目录
        if vim.fn.isdirectory(data.file) == 1 then
            api.tree.open({
                path = data.file,
            })
        end

    end,
})

