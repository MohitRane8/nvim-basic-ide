local M = {
  "SmiteshP/nvim-navic",
  commit = "0ffa7ffe6588f3417e680439872f5049e38a24db",  -- commit date: 09-18-2023
  event = "VeryLazy",
  -- dependencies = {
  --   {
  --     "neovim/nvim-lspconfig",
  --     commit = "649137cbc53a044bffde36294ce3160cb18f32c7",
  --   },
  -- },
}

function M.config()
  require("nvim-navic").setup({
    -- highlight = true,
  })
end

return M
