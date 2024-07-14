local M = {
  -- Used for previewing markdown files on web browser
  "iamcco/markdown-preview.nvim",
  commit = "a923f5fc5ba36a3b17e289dc35dc17f66d0548ee",  -- commit date: 10-17-2023
  enabled = true,                                       -- 'false' will not load the plugin
  build = function() vim.fn["mkdp#util#install"]() end,
}

-- Lazy load on following commands
M.cmd = {
  "MarkdownPreviewToggle",
}

return M
