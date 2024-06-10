local M = {
  "nvim-treesitter/nvim-treesitter-context",
  commit = "2806d83e3965017382ce08792ee527e708fa1bd4",  -- commit date: 10-28-2023
  event = "BufReadPost",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter",
      commit = "226c1475a46a2ef6d840af9caa0117a439465500",
    },
  },
  -- config = true,
  enabled = false,
}

function M.config()
  require'nvim-treesitter.configs'.setup {
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      move = {
        enable = true,
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
      },
    },
  }
end

return M
