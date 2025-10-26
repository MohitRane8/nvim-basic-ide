local M = {
  "CopilotC-Nvim/CopilotChat.nvim",
  -- commit = "494d7eae6ad89a825534f10d946169fe5c84edef",  -- commit date: 02-22-2025
  commit = "5df0b668d23c05c173f6bc79bb19642215b8b66a",  -- commit date: 06-16-2025
  enabled = false,
  dependencies = {
    { "github/copilot.vim" },
    { "nvim-lua/plenary.nvim" },  -- for curl, log and async functions
  },
  build = "make tiktoken",  -- Only on MacOS or Linux
}

-- Lazy load on following keymaps
M.keys = {
  { "<leader>;", mode = "n", ":CopilotChatToggle<CR>", silent = true, desc = "[copilotchat] copilot chat toggle" },
}

M.opts = {
  model = 'gpt-4',
  agent = 'copilot',
}

return M
