local M = {
  "lfv89/vim-interestingwords",
  commit = "e59f97aca15c6180e6f3aceaf4f7b50ca04326ed",  -- commit date: 10-29-2023
  enabled = true,                                       -- 'false' will not load the plugin
}

-- Lazy load on following keymaps
M.keys = {
  { "<leader>k", ":call InterestingWords('n')<CR>", mode = "n", silent = true, desc = "[vim-interstingwords] highlight all words in the buffer" },
  { "<leader>k", ":call InterestingWords('v')<CR>", mode = "v", silent = true, desc = "[vim-interstingwords] highlight all words in the buffer" },
  { "<leader>K", ":call UncolorAllWords()<CR>",                 silent = true, desc = "[vim-interstingwords] remove all highlights in the buffer" },
  { "<leader>n", ":call WordNavigation(1)<CR>",                 silent = true, desc = "[vim-interstingwords] jump to next highlighted word" },
  { "<leader>N", ":call WordNavigation(0)<CR>",                 silent = true, desc = "[vim-interstingwords] jump to previous highlighted word" },
}

M.config = function()
end

return M
