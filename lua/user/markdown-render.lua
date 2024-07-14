local M = {
  -- All in one markdown highlighter
  "MeanderingProgrammer/markdown.nvim",
  name = "markdown-render",
  commit = "7b8110b675766810edcbe665f53479893b02f989",  -- commit date: 07-07-2024
  enabled = true,                                       -- 'false' will not load the plugin
  dependencies = {
    "nvim-treesitter/nvim-treesitter",    -- ensure 'markdown' and 'markdown_inline' are installed
    "nvim-tree/nvim-web-devicons",
  },
  ft = { "markdown" },    -- Lazy load only for markdown files
}

M.config = function()
  local markdown = require("render-markdown")

  markdown.setup{
    headings = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
    -- headings = { '󰬺 ', '󰬻 ', '󰬼 ', '󰬽 ', '󰬾 ', '󰬿 ' },
    -- headings = { '󰎦 ', '󰎩 ', '󰎬 ', '󰎮 ', '󰎰 ', '󰎵 ' },
    code_style = "none",    -- having this set to 'full' or 'normal' breaks block highlighting when scrolling
    highlights = {
      -- code = "TabLineSel"    -- changing this doesn't seem to fix the block highlighting issue when scrolling
    }
  }

end

return M
