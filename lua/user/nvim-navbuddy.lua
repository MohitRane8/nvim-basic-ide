local M = {
  "SmiteshP/nvim-navbuddy",
  commit = "f137a3466a6cd1965cdcc5398daff54e66eebbe5",  -- commit date: 09-14-2023
  event = "VeryLazy",
  dependencies = {
    {
      "neovim/nvim-lspconfig",
      commit = "649137cbc53a044bffde36294ce3160cb18f32c7",
    },
    {
      "SmiteshP/nvim-navic",
      commit = "0ffa7ffe6588f3417e680439872f5049e38a24db",
    },
    {
      "MunifTanjim/nui.nvim",
      commit = "c0c8e347ceac53030f5c1ece1c5a5b6a17a25b32",
    },
  },
}

function M.config()
  require("nvim-navbuddy").setup({
    window = {
      size = { height = "70%", width = "85%" },
    },
    lsp = {
      auto_attach = true,
    },
    source_buffer = {
      follow_node = false,
      highlight = false,
    },
    icons = {
      File          = "󰈙 ",
      Module        = " ",
      Namespace     = "󰌗 ",
      Package       = " ",
      Class         = "󰌗 ",
      Method        = "󰆧 ",
      Property      = " ",
      Field         = " ",
      Constructor   = " ",
      Enum          = "󰕘",
      Interface     = "󰕘",
      Function      = "󰊕 ",
      -- Variable      = "󰆧 ",
      Variable      = "󰫧 ",
      Constant      = "󰏿 ",
      String        = " ",
      Number        = "󰎠 ",
      Boolean       = "◩ ",
      Array         = "󰅪 ",
      Object        = "󰅩 ",
      Key           = "󰌋 ",
      Null          = "󰟢 ",
      EnumMember    = " ",
      Struct        = "󰌗 ",
      Event         = " ",
      Operator      = "󰆕 ",
      TypeParameter = "󰊄 ",
    },
  })
end

return M
