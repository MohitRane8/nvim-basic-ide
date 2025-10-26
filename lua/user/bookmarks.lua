local M = {
  "LintaoAmons/bookmarks.nvim",
  commit = "df3ff61bd1feb978a14e0591b53a126d5360a011",  -- commit date: 2025-06-19
  enabled = true,
  event = "VeryLazy",
  dependencies = {
    {"kkharji/sqlite.lua"},
    {"nvim-telescope/telescope.nvim"},
    {"stevearc/dressing.nvim"}, -- optional: better UI
    -- {"ahmedkhalf/project.nvim"},
  },
}

M.config = function()
  -- local find_or_create_project_bookmark_group = function()
  --   local project_root = require("project_nvim.project").get_project_root()
  --   if not project_root then
  --     return
  --   end
  --
  --   local project_name = string.gsub(project_root, "^" .. os.getenv("HOME") .. "/", "")
  --   local Service = require("bookmarks.domain.service")
  --   local Repo = require("bookmarks.domain.repo")
  --   local bookmark_list = nil
  --
  --   for _, bl in ipairs(Repo.find_lists()) do
  --     if bl.name == project_name then
  --       bookmark_list = bl
  --       break
  --     end
  --   end
  --
  --   if not bookmark_list then
  --     bookmark_list = Service.create_list(project_name)
  --   end
  --   Service.set_active_list(bookmark_list.id)
  --   require("bookmarks.sign").safe_refresh_signs()
  -- end

  require("bookmarks").setup({})

  -- vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter" }, {
  --   group = vim.api.nvim_create_augroup("BookmarksGroup", {}),
  --   pattern = { "*" },
  --   callback = find_or_create_project_bookmark_group,
  -- })
end


return M
