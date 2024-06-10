local M = {
  "nvim-treesitter/nvim-treesitter",
  -- commit = "226c1475a46a2ef6d840af9caa0117a439465500", -- old commit - used for a very long time and it works but latest rainbow-delimiters.nvim doesn't work with this.
  commit = "ede5b461c9e11404b5ba0a2ba452fffaaf252907",    -- commit date: 02-25-2024
  event = "BufReadPost",
  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
      event = "VeryLazy",
    },
  },
}

function M.config()
  --require("nvim-treesitter.install").prefer_git = true
  local configs = require "nvim-treesitter.configs"

  configs.setup {
    ensure_installed = { "c", "cpp", "python", "bash", "lua", "markdown", "markdown_inline" }, -- put the language you want in this array
    -- ensure_installed = "all", -- one of "all" or a list of languages
    ignore_install = { "" },                                                       -- List of parsers to ignore installing
    sync_install = false,                                                          -- install languages synchronously (only applied to `ensure_installed`)

    highlight = {
      enable = true,       -- false will disable the whole extension
      disable = { "css" }, -- list of language that will be disabled
    },
    autopairs = {
      enable = true,
    },
    indent = { enable = true, disable = { "css", } },
  }
end

return M
