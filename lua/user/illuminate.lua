local M = {
  "RRethy/vim-illuminate",
  commit = "fbc16dee336d8cc0d3d2382ea4a53f4a29725abf",  -- commit date: 2025-05-09
  event = "VeryLazy",
  enabled = true,
}

function M.config()
  local illuminate = require "illuminate"

  -- keymaps
  vim.api.nvim_set_keymap("n", "<a-n>", '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', { noremap = true })
  vim.api.nvim_set_keymap("n", "<a-p>", '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', { noremap = true })

  illuminate.configure {
    delay = 200,
    under_cursor = true,
    providers = { "lsp", "treesitter", "regex", },  -- in priority order
    filetypes_denylist = {
      "TelescopePrompt",
      "NvimTree",
      "DiffviewFiles",
    },
    large_file_cutoff = 10000,
  }
end

return M
