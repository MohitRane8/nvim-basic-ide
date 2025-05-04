local M = {
  "williamboman/mason-lspconfig.nvim",
  commit = "93e58e100f37ef4fb0f897deeed20599dae9d128",
  -- cmd = "Mason",
  -- event = "BufReadPre",
  dependencies = {
    {
      "williamboman/mason.nvim",
      commit = "fc98833b6da5de5a9c5b1446ac541577059555be",  -- commit date: 2025-02-15
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
