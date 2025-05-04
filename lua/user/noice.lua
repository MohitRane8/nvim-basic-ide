local M = {
  "folke/noice.nvim",
  commit = "0427460c2d7f673ad60eb02b35f5e9926cf67c59",  -- commit date: 2025-02-11
  event = "VeryLazy",
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
  enabled = true,
}

M.config = function()
  require("noice").setup({
    -- Hide written, more lines and fewer lines messages
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "more line",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "fewer line",
        },
        opts = { skip = true },
      },
    },
  })
end

return M
