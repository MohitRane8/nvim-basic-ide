-- default colorscheme (must be same as the plugin name)
-- local default_colorscheme = "github-theme"
-- local default_colorscheme_flavor = "github_dark_tritanopia"
-- local default_colorscheme_flavor = "github_dark"
-- local default_colorscheme = "kanagawa"
-- local default_colorscheme_flavor = "kanagawa-wave"
-- local default_colorscheme = "gruvbox"
-- local default_colorscheme_flavor = "gruvbox"
-- local default_colorscheme = "nightfox"
-- local default_colorscheme_flavor = "duskfox"
-- local default_colorscheme_flavor = "dayfox"
-- local default_colorscheme = "bamboo"
-- local default_colorscheme_flavor = "bamboo-multiplex"
local default_colorscheme = "catppuccin"
local default_colorscheme_flavor = "catppuccin-mocha"
-- local default_colorscheme_flavor = "catppuccin-macchiato"

-- colorschemes for specific filetypes loaded by folke/styler.nvim plugin
-- colorscheme name can be a style variant like "kanagawa-dragon" for kanagawa colorscheme
-- fileytpe of a vim buffer can be identified with the command "set ft?"
-- note: styler only works with colorschemes that set highlights using vim.api.nvim_set_hl
local styler_themes = {
  -- c = { colorscheme = "catppuccin" },
  -- cpp = { colorscheme = "catppuccin" },
  -- python = { colorscheme = "nightfox" },
  -- lua = { colorscheme = "nightfox" },
  -- help = { colorscheme = "duskfox", background = "dark" },
}

local M = {
  -- Colorschemes
  {
    "Mofiqul/vscode.nvim",
    commit = "46212834b32866ce45479f885ca82d2259044f46",    -- commit date: Jun 22, 2024
    name = "vscode",
  },
  {
    "ribru17/bamboo.nvim",
    commit = "8d86d4b5dec2e35392d53a82602d4f2b12e3f014",    -- commit date: Jul 6, 2024
    name = "bamboo",
    setup = function()
      local bamboo = require "bamboo"
      bamboo.setup ({
        code_style = {
          comments = { italic = true },
          conditionals = { italic = false },
          namespaces = { italic = false },
          parameters = { italic = false },
        },
      })
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    commit = "4f44a5c930372c85483d02700f332d34417e50b2",    -- commit date: Jun 25, 2024
    name = "github-theme",
  },
  {
    "oxfist/night-owl.nvim",
    commit = "131641a516085c5b3cacc8022581902e9f2f14af",    -- commit date: Jun 27, 2024
    name = "night-owl",
  },
  {
    "EdenEast/nightfox.nvim",
    commit = "df75a6a94910ae47854341d6b5a6fd483192c0eb",    -- commit date: Apr 29, 2024
    name = "nightfox",
    setup = function()
      local nightfox = require "nightfox"
      nightfox.setup ({
        palettes = {
          nightfox = {
            bg0 = "#0b0f15",
            bg1 = "#131a24",
            bg2 = "#192330",
            bg3 = "#212e3f",
            bg4 = "#29394f",
          },
        },
      })
    end,
  },
  {
    "catppuccin/nvim",
    commit = "2d3419c2aead379b7d1854d32458f20ffaa58562",    -- commit date: Jul 8, 2024
    name = "catppuccin",
    setup = function()
      local catppuccin = require "catppuccin"
      catppuccin.setup ({
        flavor = "mocha",
        no_italic = true,
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    commit = "0a84c2df1dc65610ee0d9b516b2fb342e4b0ed6f",    -- commit date: Jul 8, 2024
    name = "tokyonight",
    setup = function()
      local tokyonight = require "tokyonight"
      tokyonight.setup ({
        style = "night",
      })
    end,
  },
  {
    -- this will be more usable after the following pull request is merged as
    -- it will allow to disable bold text for boolean values
    -- https://github.com/rebelot/kanagawa.nvim/pull/181
    "rebelot/kanagawa.nvim",
    commit = "e5f7b8a804360f0a48e40d0083a97193ee4fcc87",    -- commit date: Jul 3, 2024
    name = "kanagawa",
    setup = function()
      local kanagawa = require "kanagawa"
      kanagawa.setup ({
        keywordStyle = { italic = false },
        statementStyle = { bold = false },
        theme = "dragon",
        background = {
          dark = "dragon",
          light = "lotus"
        },
      })
    end,
  },
  {
    "loctvl842/monokai-pro.nvim",
    commit = "2bad2a92fe0ff6c8581d33a853a1b17592b83239",    -- commit date: May 25, 2024
    name = "monokai-pro",
    setup = function()
      local monokai = require "monokai-pro"
      monokai.setup ({
        filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
        styles = {
          comment = { italic = false },
          keyword = { italic = false }, -- any other keyword
          type = { italic = false }, -- (preferred) int, long, char, etc
          storageclass = { italic = false }, -- static, register, volatile, etc
          structure = { italic = false }, -- struct, union, enum, etc
          parameter = { italic = false }, -- parameter pass in function
          annotation = { italic = false },
          tag_attribute = { italic = false }, -- attribute of tag in reactjs
        },
      })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    commit = "15958f5ee43e144856cd2084ce6c571bfdb44504",    -- commit date: 2025-03-05
    name = "gruvbox",
    setup = function ()
      local gruvbox = require "gruvbox"
      gruvbox.setup({
        contrast = "hard",
      })
    end,
  },

  -- Styler is NOT a colorscheme
  -- It sets different colorschemes for specific filetypes
  {
    "folke/styler.nvim",
    commit = "2cd29996d08cec8b31270c6de64465f716ef9d71",  -- commit date: 01-19-2024
    name = "styler",
    event = "VimEnter",
    config = function()
      require("styler").setup({
        themes = styler_themes,
      })
    end,
    enabled = true,
  },
}

-- builtin colorschemes to be blacklisted from Telescope colorscheme list
local builtins = { "zellner", "torte", "slate", "shine", "ron", "quiet", "peachpuff",
"pablo", "murphy", "morning", "lunaperche", "koehler", "industry", "evening", "elflord",
"desert", "delek", "default", "darkblue", "blue" }

for _, v in ipairs(M) do
  if v.name ~= "styler" then
    -- lazy load all colorschemes on a key mapping
    -- the keymap opens Telescope for colorschemes
    -- also do not show the 'builtins' colorschemes in the Telescope list
    -- reference: https://github.com/folke/lazy.nvim/discussions/1167
    v.keys = {
      {
        "<leader>cs",
        function() -- prevent builtin colors from being displayed in the picker
          local target = vim.fn.getcompletion

          vim.fn.getcompletion = function()
            return vim.tbl_filter(function(color)
              return not vim.tbl_contains(builtins, color)
            end, target("", "color"))
          end

          vim.cmd "Telescope colorscheme"
          vim.fn.getcompletion = target
        end,
      }
    }

    -- make sure the default colorscheme loads at startup before other start plugins
    if v.name == default_colorscheme then
      v.lazy = false
      v.priority = 1000
    end

    -- config runs when the colorscheme is loaded
    v.config = function()
      -- load colorscheme specific setup if present
      if v.setup ~= nil then
        v.setup()
      end

      -- apply default colorscheme which will be loaded at the startup
      if v.name == default_colorscheme then
        vim.cmd.colorscheme(default_colorscheme_flavor)
      end
    end
  end
end

return M
