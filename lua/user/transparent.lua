local M = {
  "xiyaowong/transparent.nvim",
  commit = "3af6232c8d39d51062702e875ff6407c1eeb0391",  -- commit date: 09-03-2023
  event = "VimEnter",
}

M.config = function()
  require("transparent").setup({ -- Optional, you don't have to run setup.
    groups = { -- table: default groups
      'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
      'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
      'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
      'SignColumn', 'CursorLineNr', 'EndOfBuffer',
    },
    extra_groups = { -- table: additional groups that should be cleared
      "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
      "NvimTreeNormal" -- NvimTree
    },
    exclude_groups = {}, -- table: groups you don't want to clear
  })
end

return M
