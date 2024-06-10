local M = {
  "utilyre/barbecue.nvim",
  commit = "d38a2a023dfb1073dd0e8fee0c9be08855d3688f",  -- commit date: 09-13-2023
  event = "BufEnter",
  dependencies = {
    {
      "SmiteshP/nvim-navic",
      commit = "0ffa7ffe6588f3417e680439872f5049e38a24db",
    },
    {
      "nvim-tree/nvim-web-devicons",
      commit = "e283ab937e0197b37ec5d8013e49495193407324",
    },
  },
  config = true,
}

function M.config()
  require("barbecue").setup({
    theme = {
      normal = { bg = "#131313" },

      ellipsis = { fg = "#c3c3c3" },
      separator = { fg = "#c3c3c3" },
      modified = { fg = "#c3c3c3" },

      dirname = { fg = "#c3c3c3" },
      basename = { fg = "#029c92", bold = true },
      context = { fg = "#c3c3c3" },
    },
    show_modified = true,     -- show file modification status
    show_navic = true,
    symbols = {
      modified = " ",
      separator = ">"
    },
  })
end

return M
