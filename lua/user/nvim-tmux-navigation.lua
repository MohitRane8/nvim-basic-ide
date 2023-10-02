local M = {
  "alexghergh/nvim-tmux-navigation",
  commit = "543f090a45cef28156162883d2412fffecb6b750",
  event = "VimEnter",
}

function M.config()
  -- Shorten function name
  local keymap = vim.keymap.set
  -- Silent keymap option
  local opts = { silent = true }

  local nvim_tmux_nav = require('nvim-tmux-navigation')

  nvim_tmux_nav.setup {
      disable_when_zoomed = true -- defaults to false
  }

  -- Better window navigation
  keymap('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft, opts)
  keymap('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown, opts)
  keymap('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp, opts)
  keymap('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight, opts)
  -- keymap('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive, opts)
  -- keymap('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext, opts)
end

return M
