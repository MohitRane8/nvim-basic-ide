local M = {
  "nvim-treesitter/nvim-treesitter-textobjects",
  commit = "e69a504baf2951d52e1f1fbb05145d43f236cbf1",  -- commit date: 10-26-2023
  event = "BufReadPost",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter",
      commit = "226c1475a46a2ef6d840af9caa0117a439465500",
    },
  },
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
