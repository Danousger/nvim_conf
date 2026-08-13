vim.pack.add({'https://github.com/akinsho/bufferline.nvim.git'})
require('bufferline').setup({
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text = "Explorer",
                text_align = "center",
                separator = true,
            },
        },
    },


}) 



