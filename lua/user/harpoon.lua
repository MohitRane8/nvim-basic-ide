local M = {
  "ThePrimeagen/harpoon",
  commit = "c1aebbad9e3d13f20bedb8f2ce8b3a94e39e424a",  -- commit date: 10-20-2023
  enabled = true,                                       -- 'false' will not load the plugin
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      commit = "9a0d3bf7b832818c042aaf30f692b081ddd58bd9",
    },
  },
}

-- Lazy load on following keymaps
M.keys = {
  { "<leader>jm", "<cmd>lua require('harpoon.mark').add_file()<CR>",        silent = true, desc = "[harpoon] add file to list" },
  { "<leader>jl", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", silent = true, desc = "[harpoon] list files" },
  { "<leader>ja", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>",         silent = true, desc = "[harpoon] open file 1" },
  { "<leader>js", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>",         silent = true, desc = "[harpoon] open file 2" },
  { "<leader>jd", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>",         silent = true, desc = "[harpoon] open file 3" },
  { "<leader>jf", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>",         silent = true, desc = "[harpoon] open file 4" },
  { "<leader>jg", "<cmd>lua require('harpoon.ui').nav_file(5)<CR>",         silent = true, desc = "[harpoon] open file 5" },
  { "<leader>jn", "<cmd>lua require('harpoon.ui').nav_next()<CR>",          silent = true, desc = "[harpoon] open next file" },
  { "<leader>jp", "<cmd>lua require('harpoon.ui').nav_prev()<CR>",          silent = true, desc = "[harpoon] open previous file" },
}

M.opts = {
  -- enable tabline with harpoon marks
  tabline = false,
  tabline_prefix = "   ",
  tabline_suffix = "   ",
}

return M
