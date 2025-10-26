local M = {
  "RutaTang/quicknote.nvim",
  commit = "a60828e54b5e4c474e7d583a14df09c98882dd42",  -- commit date: 2025-01-26
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      commit = "9a0d3bf7b832818c042aaf30f692b081ddd58bd9",
    },
  },
}

M.config = function()
  require("quicknote").setup({
    mode = "portable",
    sign = " ",
    filetype = "txt",
  })
end

return M
