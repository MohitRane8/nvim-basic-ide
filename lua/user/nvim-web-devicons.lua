local M = {
  "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  commit = "1fb58cca9aebbc4fd32b086cb413548ce132c127"   -- commit date: 2025-05-15
}

function M.config()
  require("nvim-web-devicons").setup {
    override = {
      zsh = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "Zsh",
      },
    },
    color_icons = true,
    default = true,
  }
end

return M
