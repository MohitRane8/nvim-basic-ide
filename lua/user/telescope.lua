local M = {
  "nvim-telescope/telescope.nvim",
  -- commit = "40c31fdde93bcd85aeb3447bb3e2a3208395a868", -- old commit - used for a very long time and it all works except folding with treesitter.
  commit = "1e591885751d255b12c3649253cb6c2838e2c724",    -- commit date: 03-23-2024
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
  },
}

M.config = function ()
  local actions = require "telescope.actions"
  local actions_layout = require "telescope.actions.layout"
  local actions_state = require "telescope.actions.state"
  local actions_generate = require "telescope.actions.generate"
  -- local entry_display = require('telescope.pickers.entry_display')

  local action_align_top = function(prompt_bufnr)
    actions.select_default(prompt_bufnr)
    vim.cmd('normal! zt')
  end

  -- Send selected entries to quickfix list if there are any, otherwise send all entries
  local function custom_send_to_qflist(prompt_bufnr)
    local picker = actions_state.get_current_picker(prompt_bufnr)
    local num_selections = #picker:get_multi_selection()

    if num_selections > 0 then
      actions.send_selected_to_qflist(prompt_bufnr)
    else
      actions.send_to_qflist(prompt_bufnr)
    end

    -- Open the quickfix list
    vim.cmd("copen")
  end

  require('telescope').setup({
    defaults = {
      prompt_prefix = " ",
      selection_caret = "> ",
      -- path_display = {
      --   -- "smart",
      --   -- shorten = 5,
      --   -- shorten = { len = 1, exclude = {1, -1} },
      --   -- shorten = { len = 2, exclude = {2, -2} },
      -- },
      path_display = function(opts, path)
        return string.format("%-60s", path)
      end,
      file_ignore_patterns = { ".git/" },
      layout_strategy = "horizontal",
      entry_display = function(entry)
        -- local filename = entry.filename or vim.fn.fnamemodify(entry.path, ':~:.')
        -- local display = string.format('%-50s %s', filename, entry.text)
        -- return display
        return {
          value = entry,
          display = entry[1],
          ordinal = entry[1],
        }
      end,
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
          ["<C-;>"] = actions_layout.toggle_preview,
          ["<C-q>"] = custom_send_to_qflist,
          ["?"] = actions_generate.which_key {
            name_width = 20, -- typically leads to smaller floats
            max_height = 0.5, -- increase potential maximum height
            separator = " > ", -- change sep between mode, keybind, and name
            close_with_action = false, -- do not close float on action
          },
        },
        i = {
          ["<C-j>"] = actions.preview_scrolling_down,
          ["<C-k>"] = actions.preview_scrolling_up,
          ["<C-;>"] = actions_layout.toggle_preview,
          ["<C-q>"] = custom_send_to_qflist,
        },
      },
      -- Custom display function
      -- entry_maker = function(entry)
      --   local displayer = entry_display.create{
      --     separator = " ",
      --     items = {
      --       {width = 70},  -- Adjust the width as needed
      --       {remaining = true},
      --     },
      --   }
      --
      --   local make_display = function(e)
      --     return displayer{
      --       {e.filename, "TelescopeResultsIdentifier"},
      --       {e.text},
      --     }
      --   end
      --
      --   return {
      --     value = entry,
      --     ordinal = entry.filename .. " " .. entry.text,
      --     display = make_display,
      --     filename = entry.filename,
      --     text = entry.text,
      --   }
      -- end,
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
        theme = "dropdown",
        enable_preview = true,
      }
    },
  })

  -- load fzf extension after telescope setup
  require('telescope').load_extension('fzf')
end

return M
