local M = {
  "nvim-tree/nvim-tree.lua",
  commit = "4054fc4be31bbb34da3a96be1cc03e09aa13bbbb",
  enabled = true,                                       -- 'false' will not load the plugin
}

-- Lazy load on following keymaps
M.keys = {
  { "<leader>e", ":NvimTreeToggle<CR>", silent = true, desc = "[nvim-tree] open file tree" },
}

local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
  vim.keymap.set("n", "<CR>", api.node.open.edit, opts "Open")
  vim.keymap.set("n", "o", api.node.open.edit, opts "Open")
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Close Directory")
  vim.keymap.set("n", "v", api.node.open.vertical, opts "Open: Vertical Split")
end

function M.config()
  -- local tree_cb = require("nvim-tree.config").nvim_tree_callback
  require("nvim-tree").setup {
    on_attach = on_attach,
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },

    renderer = {
      root_folder_label = false,    -- hide absolute path of root folder
      indent_markers = { enable = true, },
      -- highlight_git = true,
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            untracked = "U",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
    -- diagnostics = {
    --   enable = true,
    --   show_on_dirs = true,
    --   icons = {
    --     hint = "󰌵",
    --     info = "",
    --     warning = "",
    --     error = "",
    --   },
    -- },
    view = {
      width = 35,
      side = "right",
    },
    actions = {
      open_file = {
        window_picker = {
          enable = false,   -- open files or preview files in window 1 directly
        },
      },
    },
  }
end

return M
