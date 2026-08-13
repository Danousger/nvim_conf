-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}


-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

vim.keymap.set('n', '<leader>w', ':w<CR>',opts)
vim.keymap.set('n', '<leader>q', ':qall<CR>',opts)
vim.keymap.set('n', '<C-s>', ':w<CR>',opts)
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a',opts)

-- Special for Nvim-tree plugin
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

-- Special for Trouble plugin
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>")
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>")
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle<CR>")
vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle<CR>")
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<CR>")
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<CR>")

--Special for Hop plugin
vim.keymap.set("n", "<leader><leader>j", "<cmd>HopVertical<CR>")
-- Special for buffer line plugin
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", opts)
-- Special for Mini.Bufremove
vim.keymap.set("n", "<leader>bd", function()
    require("mini.bufremove").delete(0, false)
end)
vim.keymap.set("n", "<leader>pf", "<cmd>Pick files<CR>")
-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)



-----------------
-- Insert mode --
-----------------
vim.keymap.set('i', 'jk', '<esc>', opts)
