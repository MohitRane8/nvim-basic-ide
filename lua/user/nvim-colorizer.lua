local M = {
  "norcalli/nvim-colorizer.lua",
  commit = "a065833f35a3a7cc3ef137ac88b5381da2ba302e",  -- commit date: 05-10-2024
  event = "VeryLazy",
  enabled = true,
}

function M.config()
  require('colorizer').setup()
end

return M
