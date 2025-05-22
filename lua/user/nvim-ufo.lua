local M = {
  "kevinhwang91/nvim-ufo",
  commit = "a52c92c3bbaa10f0c9b547a50adaa8c7d8b29f94",  -- commit date: 2025-02-14
  event = "VeryLazy",
  dependencies = {
    "kevinhwang91/promise-async",
    commit = "119e8961014c9bfaf1487bf3c2a393d254f337e2",  -- commit date: 2024-08-4
  },
  enabled = true,
}

local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = (' 󰁂 %d '):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, {chunkText, hlGroup})
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
          suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, {suffix, 'MoreMsg'})
  return newVirtText
end


M.config = function()
  local ufo = require('ufo')

  -- Keymaps
  local keymap = vim.keymap.set
  local opts = { silent = true }
  keymap('n', 'zR', ufo.openAllFolds, opts)
  keymap('n', 'zM', ufo.closeAllFolds, opts)
  keymap('n', 'zr', ufo.openFoldsExceptKinds, opts)
  keymap('n', 'zm', ufo.closeFoldsWith, opts) -- closeAllFolds == closeFoldsWith(0)
  -- keymap('n', 'L', function()
  --   local winid = ufo.peekFoldedLinesUnderCursor()
  --   if not winid then
  --     vim.lsp.buf.hover()
  --   end
  -- end)

  ufo.setup({
    open_fold_hl_timeout = 0,
    close_fold_kinds_for_ft = {
      -- default = {'imports', 'comment'},
      -- json = {'array'},
      -- c = {'comment', 'region'},
      -- cpp = {'comment', 'region'},
    },
    -- preview = {
    --   win_config = {
    --     border = {'', '─', '', '', '', '─', '', ''},
    --     -- winhighlight = 'Normal:Folded',
    --     winblend = 0
    --   },
    --   mappings = {
    --     scrollU = '<C-u>',
    --     scrollD = '<C-d>',
    --     jumpTop = '[',
    --     jumpBot = ']'
    --   }
    -- },
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end,
    fold_virt_text_handler = handler,
  })
end

return M
