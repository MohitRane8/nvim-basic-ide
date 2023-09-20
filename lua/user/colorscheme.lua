local M = {
--  {
--    "folke/tokyonight.nvim",
--    commit = "e52c41314e83232840d6970e6b072f9fba242eb9",
--  },
--  {
    "loctvl842/monokai-pro.nvim",
    commit = "e7b38bdb95fc144456703bb0ff5692c68093cc8e",
--  },
--  {
--    "Mofiqul/vscode.nvim",
--    commit = "dc5f37603ada51db13bc4009cbee628c5857a274",
--  },

  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

M.name = "monokai-pro"

function M.config()

  -- monokai-pro
--  if M.name == "monokai-pro" then
  local monokai = require "monokai-pro"
  monokai.setup ({
    filter = "ristretto", -- classic | octagon | pro | machine | ristretto | spectrum
  })
  monokai.load()

  -- vscode
--  elseif M.name == "vscode" then
--    local vscode = require "vscode"
--    vscode.load('dark')       -- light
--  end

  -- load colorscheme
  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    return
  end

end

return M
