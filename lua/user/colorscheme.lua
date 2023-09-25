local M = {
  -- {
    "loctvl842/monokai-pro.nvim",
    commit = "e7b38bdb95fc144456703bb0ff5692c68093cc8e",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   commit = "e52c41314e83232840d6970e6b072f9fba242eb9",
  --   lazy = true,
  -- },
  -- {
  --   "Mofiqul/vscode.nvim",
  --   commit = "dc5f37603ada51db13bc4009cbee628c5857a274",
  --   lazy = true,
  -- },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   commit = "b573866ef64122119668f375ebb794bcb3b518e2",    -- v1.4.0
  --   lazy = true,
  -- },
}

M.name = "monokai-pro"

function M.config()

  -- monokai-pro
  local monokai = require "monokai-pro"
  monokai.setup ({
    filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
  })
  monokai.load()

  -- vscode
  -- local vscode = require "vscode"
  -- vscode.load('dark')       -- light

  -- load colorscheme
  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    return
  end

end

return M
