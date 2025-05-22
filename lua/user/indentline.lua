local M = {
  "lukas-reineke/indent-blankline.nvim",
  commit = "e10626f7fcd51ccd56d7ffc00883ba7e0aa28f78",    -- commit date: 2025-01-20
  event = "BufReadPre",
  -- main = "ibl",
}

M.opts = {
  indent = {
    -- char = "▏",   -- U+258F
    -- char = "│",   -- U+2502
    -- char = "┊",   -- U+250A
  },
  exclude = {
    filetypes = { "TelescopePrompt", "NvimTree", "DiffviewFiles", "help" },
    buftypes = { "terminal", "nofile", "telescope", "help" },
  },
  scope = {
    enabled = false,
  }
}

return M
