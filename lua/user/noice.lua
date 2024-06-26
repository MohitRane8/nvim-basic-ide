local M = {
  "folke/noice.nvim",
  commit = "88ac36864b5976a64b14a8f156c616f41b32f228",  -- commit date: 06-18-2024
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
