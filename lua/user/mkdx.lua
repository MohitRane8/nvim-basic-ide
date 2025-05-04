local M = {
  -- All in one markdown editor
  "SidOfc/mkdx",
  commit = "ee667cad506954b706c3fa972fbaaad46b1bf028",  -- commit date: Oct 16, 2023
  ft = { "markdown" },
  event = "VeryLazy",
  enabled = false,
}

M.init = function()
  -- Disable shift behavior for Enter key in mkdx plugin
  vim.g['mkdx#settings'] = {
    enter = {
      enable = 1,
      shift = 0,
    },
    tab = {
      enable = 1,
    }
  }
end

return M
