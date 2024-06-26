-- default colorscheme (must be same as the plugin name)
local default_colorscheme = "github-theme"
local default_colorscheme_flavor = "github_dark_tritanopia"

-- colorschemes for specific filetypes loaded by folke/styler.nvim plugin
-- colorscheme name can be a style variant like "kanagawa-dragon" for kanagawa colorscheme
-- fileytpe of a vim buffer can be identified with the command "set ft?"
-- note: styler only works with colorschemes that set highlights using vim.api.nvim_set_hl
local styler_themes = {
  -- c = { colorscheme = "catppuccin" },
  -- cpp = { colorscheme = "catppuccin" },
  python = { colorscheme = "nightfox" },
  -- lua = { colorscheme = "nightfox" },
  help = { colorscheme = "duskfox", background = "dark" },
}

local M = {
  -- Colorschemes
  {
    "Mofiqul/vscode.nvim",
    commit = "dc5f37603ada51db13bc4009cbee628c5857a274",
    name = "vscode",
  },
  {
    "ribru17/bamboo.nvim",
    commit = "2c5a7442f8db3dcc3f5175f0bed73675e26e3931",
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
    commit = "d92e1143e5aaa0d7df28a26dd8ee2102df2cadd8",
    name = "github-theme",
  },
  {
    "oxfist/night-owl.nvim",
    commit = "b9205dac99317b9ece31636a0414d35efb957aca",
    name = "night-owl",
  },
  {
    "EdenEast/nightfox.nvim",
    commit = "57b8154aba0de8ced36722ea2674a7b97e4f468f",    -- v3.9.3
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
    commit = "b573866ef64122119668f375ebb794bcb3b518e2",    -- v1.4.0
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
    commit = "e52c41314e83232840d6970e6b072f9fba242eb9",
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
    commit = "ab41956c4559c3eb21e713fcdf54cda1cb6d5f40",
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
    commit = "e7b38bdb95fc144456703bb0ff5692c68093cc8e",
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
