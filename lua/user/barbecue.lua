local M = {
  "utilyre/barbecue.nvim",
  commit = "d38a2a023dfb1073dd0e8fee0c9be08855d3688f",  -- commit date: 09-13-2023
  event = "BufEnter",
  dependencies = {
    {
      "SmiteshP/nvim-navic",
      commit = "0ffa7ffe6588f3417e680439872f5049e38a24db",
    },
    {
      "nvim-tree/nvim-web-devicons",
      commit = "e283ab937e0197b37ec5d8013e49495193407324",
    },
    {
      "nvim-lualine/lualine.nvim",    -- Only required for theme colors
    },
  },
  config = true,
  enabled = true,
}

vim.api.nvim_create_autocmd({
  "WinScrolled",
  "WinResized",
  "BufWinEnter",
  "CursorHold",
  "InsertLeave",
  "BufModifiedSet",
}, {
  group = vim.api.nvim_create_augroup("barbecue.updater", {}),
  callback = function()
    -- Call barbecue UI updater for all windows in the current tabpage
    for _, winnr in pairs(vim.api.nvim_tabpage_list_wins(0)) do
      require("barbecue.ui").update(winnr)
    end
  end,
})

function M.config()
  -- Minor inconvenience: lualine.themes.auto colors don't refresh upon colorscheme
  -- change even though the lualine colors themselves update. This causes barbecue
  -- to get stuck with the colors it setup on Neovim startup (default colorscheme).
  local lualine_theme = require('lualine.themes.auto')
  -- local git_stats = vim.b.gitsigns_status_dict

  vim.api.nvim_set_hl(0, 'my_barbecue_lead_custom_section', { fg = lualine_theme.insert.a.bg, bg = lualine_theme.normal.c.bg, bold = true })

  require('barbecue').setup({
    theme = {
      normal = { bg = lualine_theme.normal.c.bg },

      ellipsis = { fg = lualine_theme.normal.b.bg },
      separator = { fg = lualine_theme.normal.b.bg },
      modified = { fg = lualine_theme.replace.a.bg },

      dirname = { fg = lualine_theme.normal.a.bg },
      basename = {
        fg = lualine_theme.visual.a.bg,
        bold = true
      },
      context = { fg = lualine_theme.normal.a.bg },
    },
    show_modified = true,
    show_navic = true,
    symbols = {
      modified = "●",           -- other icons: ●,  ,  ,  , 󰗮
      separator = " "
    },
    create_autocmd = false,
    lead_custom_section = function(bufnr, winnr)
      -- Get the current window ID
      local current_win = vim.api.nvim_get_current_win()

      -- For current window, show active status, else show inactive status
      if winnr == current_win  then
        return( { { '  ', 'my_barbecue_lead_custom_section' }, { ' ' } } )   -- other icons:  ,  , 
      else
        return( '   ' )  -- other icons:  
      end
    end,
    -- custom_section = function(bufnr, winnr)
    --   local error_icon = ''
    --   local warning_icon = ''
    --   local info_icon = ''
    --   local hint_icon = '⚑'
    --   local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    --   local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    --   local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    --   local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    --   -- local git_lines_added = vim.api.nvim_buf_get_var(bufnr, gitsigns_status_dict.added)
    --   local git_lines = vim.api.nvim_buf_get_var(bufnr, 'gitsigns_status')
    --   local components = {}
    --   if errors > 0 then
    --     components[#components + 1] = { error_icon .. ' ' .. errors, 'DiagnosticError' }
    --   end
    --
    --   if warnings > 0 then
    --     components[#components + 1] =
    --       { (#components > 0 and ' ' or '') .. warning_icon .. ' ' .. warnings, 'DiagnosticWarning' }
    --   end
    --
    --   if hints > 0 then
    --     components[#components + 1] =
    --       { (#components > 0 and ' ' or '') .. hint_icon .. ' ' .. hints, 'DiagnosticHint' }
    --   end
    --
    --   if info > 0 then
    --     components[#components + 1] =
    --       { (#components > 0 and ' ' or '') .. info_icon .. ' ' .. info, 'DiagnosticInfo' }
    --   end
    --
    --   -- if git_lines_added > 0 then
    --   --   components[#components + 1] =
    --   --     { (#components > 0 and ' ' or '') .. info_icon .. ' ' .. git_lines_added, 'GitSignsAdd' }
    --   -- end
    --
    --   return components
    -- end,
  })
end

return M
