local M = {
  "numToStr/Comment.nvim",
  commit = "e30b7f2008e52442154b66f7c519bfd2f1e32acb", -- commit date: 06-09-2024
  event = "VeryLazy",
  enabled = true,
}

-- Extend functionality to include blockwise comment inesrtion
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
keymap('n', '<leader>bO', ':lua require("Comment.api").insert.blockwise.above()<CR>', opts)
keymap('n', '<leader>bo', ':lua require("Comment.api").insert.blockwise.below()<CR>', opts)

function M.config()
  require('Comment').setup {
    -- Use <leader> instead of plugin default 'g'
    toggler = { line = '<leader>cc', block = '<leader>bb' },
    opleader = { line = '<leader>c', block = '<leader>b' },
    extra = { above = '<leader>cO', below = '<leader>co' },
  }
end

return M
