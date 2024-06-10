local M = {
  "ibhagwan/fzf-lua",
  commit = "c965f107ab7616255c8da15a5b782069198b9749",  -- commit date: 10-27-2023
  event = "VimEnter",
  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
      event = "VeryLazy",
    },
  },
  enabled = true,
}

M.config = function()
  local fzf = require("fzf-lua")

  fzf.setup({
    -- "telescope",
    -- "fzf-native",
    -- winopts = { preview = { defaults = "builtin" } },
    keymap = {
      builtin = {
        ["<S-right>"]   = "preview-page-down",
        ["<S-left>"]    = "preview-page-up",
      },
      -- fzf = {
      --   -- preview_page_down = "<C-j>",
      --   -- preview_page_up = "<C-k>",
      --   -- scroll_up = '<C-k>',
      --   -- scroll_down = '<C-j>',
      --     ["shift-left"]  = "preview-page-down",
      --     ["shift-right"] = "preview-page-up",
      -- },
    },
    "max-perf",
  })

end

return M
