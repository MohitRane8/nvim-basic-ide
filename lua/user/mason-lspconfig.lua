local M = {
  "williamboman/mason-lspconfig.nvim",
  commit = "93e58e100f37ef4fb0f897deeed20599dae9d128",
  -- cmd = "Mason",
  -- event = "BufReadPre",
  dependencies = {
    {
      "williamboman/mason.nvim",
      commit = "4546dec8b56bc56bc1d81e717e4a935bc7cd6477",
    },
  },
}

function M.config()
  -- First, setup mason
  -- require("mason").setup(settings)
  require("mason").setup()

  -- Second, setup mason-lspconfig, as it depends on mason
  require("mason-lspconfig").setup {
    ensure_installed = require("utils").mason_servers,
    automatic_installation = true,
  }
end

return M
