local M = {
  "folke/flash.nvim",
  commit = "43f67935d388fbb540f8b40e8cbfd80de54f978a",  -- commit date: 06-05-2024
  event = "VeryLazy",
  enabled = true,
}

M.config = function()
  require("flash").setup({
    label = {
      -- rainbow = { enabled = true },    -- useful for flash treesitter
    },
    modes = {
      search = { enabled = true },
    },
    -- remote_op = {
    --   restore = true,
    --   motion = false,
    -- }
  })
end

return M
