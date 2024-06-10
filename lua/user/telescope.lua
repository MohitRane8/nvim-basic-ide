local M = {
  "nvim-telescope/telescope.nvim",
  commit = "40c31fdde93bcd85aeb3447bb3e2a3208395a868",
  event = "VimEnter",
  cmd = { "Telescope" },
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      commit = "6c921ca12321edaa773e324ef64ea301a1d0da62",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    },
    {
      "nvim-lua/plenary.nvim",
      commit = "9a0d3bf7b832818c042aaf30f692b081ddd58bd9",
    },
    {
      "ahmedkhalf/project.nvim",
    },
  },
}

M.config = function ()
  local actions = require "telescope.actions"

  local action_align_top = function(prompt_bufnr)
    actions.select_default(prompt_bufnr)
    vim.cmd('normal! zt')
  end

  require('telescope').setup({
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
            if cols < 200 then
              return math.floor(cols * 0.4)
            else
              return math.floor(cols * 0.5)
            end
          end,
        },
        scroll_speed = 1,
      },
      sorting_strategy = "ascending",
      mappings = {
        n = {
          ["<C-j>"] = actions.preview_scrolling_down,
          ["<C-k>"] = actions.preview_scrolling_up,
        },
        i = {
          ["<C-j>"] = actions.preview_scrolling_down,
          ["<C-k>"] = actions.preview_scrolling_up,
        },
      },
    },
    pickers = {
      git_files = {
        theme = "dropdown",
        previewer = false,
      },
      find_files = {
        theme = "dropdown",
        previewer = false,
      },
      buffers = {
        mappings = {
          n = {
            ["<C-d>"] = actions.delete_buffer,
          },
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
        },
      },
      live_grep = {
        disable_coordinates = true,
      },
      grep_string = {
        disable_coordinates = true,
        disable_devicons = true,
        -- previewer = false,
      },
      treesitter = {
        show_line = false,
        mappings = {
          n = {
            ["h"] = action_align_top,
          },
          i = {
            ["h"] = action_align_top,
          },
        },
      },
      lsp_references = {
        include_declaration = true,
        include_current_line = true,
      },
      colorscheme = {
        enable_preview = true,
      }
    },
  })

  -- load fzf extension after telescope setup
  require('telescope').load_extension('fzf')
end

return M
