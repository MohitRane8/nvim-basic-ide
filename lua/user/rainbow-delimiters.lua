local M = {
  "hiphish/rainbow-delimiters.nvim",
  commit = "55ad4fb76ab68460f700599b7449385f0c4e858e",  -- commit date: 2025-04-16
  event = "BufReadPost",
  config = function()
    require('rainbow-delimiters.setup').setup {
      highlight = {
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
        'RainbowDelimiterRed',
      },
    }
  end,
  enabled = true,
}

return M
