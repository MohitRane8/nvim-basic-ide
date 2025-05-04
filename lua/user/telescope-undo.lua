local M = {
  "debugloop/telescope-undo.nvim",
  commit = "928d0c2dc9606e01e2cc547196f48d2eaecf58e5",    -- commit date: 01-31-2025
  enabled = true,                                         -- 'false' will not load the plugin
  dependencies = {
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
}

-- Lazy load on following keymaps
M.keys = {
  { "<leader>u", "<cmd>Telescope undo<CR>", silent = true, desc = "[telescope-undo] [telescope] undo history" },
}

M.opts = {
  extensions = {
    undo = {
      use_delta = true,
      side_by_side = true,
      layout_strategy = "vertical",
      layout_config = {
        preview_height = 0.8,
      },
      saved_only = true,
    },
  },
}

M.config = function(_, opts)
  -- Only load extension after the Telescope plugin setup is loaded.
  -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
  -- configs for us. We won't use data, as everything is in it's own namespace (telescope
  -- defaults, as well as each extension).
  require("telescope").setup(opts)
  require("telescope").load_extension("undo")
end

return M
