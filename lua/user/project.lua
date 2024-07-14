local M = {
  "ahmedkhalf/project.nvim",
  commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4",
  enabled = false,                                       -- 'false' will not load the plugin
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
}

-- Lazy load on following keymaps
-- NOTE: Unless "ahmedkhalf/project.nvim" is specified as a dependency in telescope.lua,
-- the keyamp will need to be called twice to work
M.keys = {
  { "<leader>fp", ":Telescope projects<CR>", silent = true, desc = "[project] [telescope] list all projects" },
}

function M.config()
  require("telescope").load_extension("projects")
  require("project_nvim").setup()
end

return M
