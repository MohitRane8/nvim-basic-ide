local M = {
  "nvim-lualine/lualine.nvim",
  commit = "0050b308552e45f7128f399886c86afefc3eb988",
  event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
}

function M.config()
  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    return
  end

  local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end

  local mode = {
    "mode",
    fmt = function(str) return str:sub(1,1) end
  }

  local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    -- symbols = { error = " ", warn = " " },
    symbols = { error = "  ", warn = "  " },
    colored = false,
    always_visible = true,
  }

  local diff = {
    "diff",
    colored = true,
    symbols = { added = "󰐙 ", modified = "󰻃 ", removed = "󰍷 " }, -- changes diff symbols
    cond = hide_in_width,
  }

  local tabs = {
    "tabs",
    use_mode_colors = true,
    tabs_color = {
      -- Same values as the general color option can be used here.
      -- active = 'lualine_{section}_normal',     -- Color for active tab.
      -- inactive = 'lualine_{section}_inactive', -- Color for inactive tab.
    },
  }

  local filetype = {
    "filetype",
    icons_enabled = false,
  }

  local location = {
    "location",
    padding = 2,
  }

  local spaces = function()
    return "󱁐  " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end
  lualine.setup {
    options = {
      globalstatus = true,
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "alpha", "dashboard" },
      always_divide_middle = true,
    },
    sections = {
      -- check :h lualine-Available-components for list of components that can be displayed on lualine
      -- some componenets need to be in quotes
      -- cool icons: 󰰤 󰯫 󰯮 󰰡 , 󰬁 󰫮 󰫯 󰬀 ,  ,  ,  ,  ,  ,  ,  ,  ,  ,  ,  ,  ,  ,  ,  ,  , 󰀱 , 󰙴 , 󰍛 , 󰑣 , 󰜗 
      -- lualine_a = { { function() return ' ' end }, tabs }, -- shows only 1st char of mode
      lualine_a = { mode },
      lualine_b = { tabs },
      lualine_c = { },
      lualine_x = { "diff", { function() return ' ' end }, diagnostics, { function() return ' ' end }, spaces, { function() return ' ' end } },
      lualine_y = { location },
      lualine_z = { "branch" },
    },
    inactive_sections = {
      lualine_a = { },
      lualine_b = { },
      lualine_c = { },
      lualine_x = { location },
      lualine_y = { },
      lualine_z = { },
    }
  }
end

return M
