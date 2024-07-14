local M = {
  -- Markdown editing helper
  "preservim/vim-markdown",
  commit = "a657e697376909c41475a686eeef7fc7a4972d94",  -- ensure master branch commit  -- commit date: Mar 1, 2024
  event = "VeryLazy",
  dependencies = {
    "godlygeek/tabular",
  },
  ft = { "markdown" },
  enabled = false,
}

return M
