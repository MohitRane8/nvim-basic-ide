local M = {
  "nvim-telescope/telescope.nvim",
  commit = "40c31fdde93bcd85aeb3447bb3e2a3208395a868",
  event = "Bufenter",
  cmd = { "Telescope" },
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      commit = "9a0d3bf7b832818c042aaf30f692b081ddd58bd9",
    },
    {
      "ahmedkhalf/project.nvim",
    },
  },
}

local actions = require "telescope.actions"

M.opts = {
  defaults = {
    prompt_prefix = " ",
    selection_caret = "> ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/" },
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        height = 0.94,
        width = 0.90,
        prompt_position = "top",
        preview_width = function(_, cols, _)
          if cols > 200 then
            return math.floor(cols * 0.4)
          else
            return math.floor(cols * 0.6)
          end
        end,
      },
      scroll_speed = 1,
    },
    sorting_strategy = "ascending",
    mappings = {
      i = {
        ["<C-j>"] = actions.preview_scrolling_down,
        ["<C-k>"] = actions.preview_scrolling_up,
      },
      n = {
        ["<C-j>"] = actions.preview_scrolling_down,
        ["<C-k>"] = actions.preview_scrolling_up,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
    },
    live_grep = {
      disable_coordinates = true,
    },
    grep_string = {
      disable_coordinates = true,
    },
    treesitter = {
      show_line = false,
    },
    lsp_references = {
      include_declaration = true,
      include_current_line = true,
    },
  },
  -- colorscheme = { enable_preview = true, }
}

return M
