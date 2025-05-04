local M = {
  "rcarriga/nvim-notify",
  commit = "d333b6f167900f6d9d42a59005d82919830626bf",  -- commit date: 05-17-2024
  event = "VeryLazy",
}

M.opts = {
  top_down = false,
}

-- Show notification for macro recording start and stop
vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function()
    local reg = vim.fn.reg_recording()
    require("notify")("Macro recording started on @ " .. reg, "info", { title = "Macro" })
  end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    require("notify")("Macro recording stopped", "info", { title = "Macro" })
  end,
})

return M
