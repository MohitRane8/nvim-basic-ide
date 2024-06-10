local M = {
  "RRethy/vim-illuminate",
  commit = "d6ca7f77eeaf61b3e6ce9f0e5a978d606df44298",
  event = "VeryLazy",
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
  }
end

return M
