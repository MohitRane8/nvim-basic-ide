local M = {
  "lewis6991/gitsigns.nvim",
  commit = "6668f379ca634c36b8e11453118590b91bf8b295",  -- 2025-02-18
  enabled = true,                                       -- 'false' will not load the plugin
  event = "VeryLazy",
}

-- -- Lazy load on following keymaps
-- M.keys = {
--   { "]c", "<cmd>lua require('gitsigns').next_hunk()<CR>",                         silent = true, desc = "[gitsigns] go to next git hunk" },
--   { "[c", "<cmd>lua require('gitsigns').prev_hunk()<CR>",                         silent = true, desc = "[gitsigns] go to previous git hunk" },
--   { "<leader>hs", "<cmd>lua require('gitsigns').stage_hunk()<CR>",                silent = true, desc = "[gitsigns] stage git hunk" },
--   { "<leader>hr", "<cmd>lua require('gitsigns').reset_hunk()<CR>",                silent = true, desc = "[gitsigns] reset git hunk" },
--   { "<leader>hS", "<cmd>lua require('gitsigns').stage_buffer()<CR>",              silent = true, desc = "[gitsigns] stage buffer" },
--   { "<leader>hu", "<cmd>lua require('gitsigns').undo_stage_hunk()<CR>",           silent = true, desc = "[gitsigns] undo stage buffer" },
--   { "<leader>hR", "<cmd>lua require('gitsigns').reset_buffer()<CR>",              silent = true, desc = "[gitsigns] reset all git hunks in buffer" },
--   { "<leader>hp", "<cmd>lua require('gitsigns').preview_hunk_inline()<CR>",       silent = true, desc = "[gitsigns] preview git hunk inline" },
--   { "<leader>hb", "<cmd>lua require('gitsigns').blame_line()<CR>",                silent = true, desc = "[gitsigns] ?" },
--   { "<leader>tb", "<cmd>lua require('gitsigns').toggle_current_line_blame()<CR>", silent = true, desc = "[gitsigns] ?" },
--   { "<leader>hd", "<cmd>lua require('gitsigns').diffthis()<CR>",                  silent = true, desc = "[gitsigns] diff with index" },
--   { "<leader>hD", "<cmd>lua require('gitsigns').diffthis("~")<CR>",               silent = true, desc = "[gitsigns] diff with working tree" },
--   { "<leader>td", "<cmd>lua require('gitsigns').toggle_deleted()<CR>",            silent = true, desc = "[gitsigns] toggle display of deleted lines" },
--   -- Text object
--   -- TEST: check if the following works? Not sure if the 'mode' is written correctly.
--   { "ih", ":<C-U>lua require('gitsigns').select_hunk()<CR>", mode = {"o", "x"},   silent = true, desc = "[gitsigns] ?" },
-- }

M.opts = {
  signs = {
    -- symbols for signs: "▎", "┃", "󰐊", "┆", "│"
    add = { hl = "GitSignsAdd", text = "┃", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "┃", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "┃", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "┃", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "┃", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    untracked = { hl = "GitSignsAdd", text = "┃", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  diff_opts = {
    algorithm = "myers", -- myers, minimal, patience, histogram
    vertical = true,
  },
}

return M
