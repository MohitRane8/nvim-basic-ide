local M = {
  "SmiteshP/nvim-navic",
  commit = "f887d794a0f4594882814d7780980a949200a238",  -- commit date: 2025-05-09
  event = "VeryLazy",
  enabled = true,
}

function M.config()
  require("nvim-navic").setup({
    -- highlight = true,
  })
end

return M
