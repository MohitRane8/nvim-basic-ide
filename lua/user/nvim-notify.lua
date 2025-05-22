local M = {
  "rcarriga/nvim-notify",
  commit = "b5825cf9ee881dd8e43309c93374ed5b87b7a896",  -- commit date: 2025-04-13
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
