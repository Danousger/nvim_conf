vim.pack.add({
  { src = 'https://github.com/nvim-tree/nvim-tree.lua' }
})
local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
  
end

require("nvim-tree").setup({
  on_attach = my_on_attach,
})
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})
