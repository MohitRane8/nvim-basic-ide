local M = {
  "ggandor/leap.nvim",
  commit = "0eb3611593e135150e2f7880ec67568ccb51c17a",
  event = "VimEnter",
}

function M.config()
  local status_ok, leap = pcall(require, "leap")
  if not status_ok then
    return
  end

  leap.add_default_mappings()
end

return M
