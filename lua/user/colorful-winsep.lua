local M = {
  "nvim-zh/colorful-winsep.nvim",
  commit = "e1b72c498f25c1fc37a7e9913332c137f753a90a",  -- commit date: 05-31-2023
  event = "WinNew",
  enabled = false,
}

M.config = function()
  require("colorful-winsep").setup({
    highlight = {
      -- bg = "#16161E",
      fg = "#534e57",
    },
    no_exec_files = { "TelescopePrompt", "mason", "NvimTree" },
    -- symbols = { "━", "┃", "┏", "┓", "┗", "┛" },    -- heavy continuous border
    -- symbols = { "─", "│", "┌", "┐", "└", "┘" },    -- light continuous border
    -- symbols = { "─ ─", "|", "┌", "┐", "└", "┘" },  -- light long dotted border
    symbols = { "╶", "┆", "┌", "┐", "└", "┘" },  -- light short dotted border
  })
end

return M
