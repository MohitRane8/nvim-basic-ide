local M = {
  "hiphish/rainbow-delimiters.nvim",
  commit = "161eb67a82ee269d1037df64c6d5a05bd5860d32",  -- commit date: 02-22-2024
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
