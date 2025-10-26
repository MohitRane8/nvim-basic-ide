local M = {
  "ahmedkhalf/project.nvim",
  commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb",    -- commit date: 2023-04-03
  enabled = false,
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
