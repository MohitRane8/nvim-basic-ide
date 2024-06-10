vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown", "text" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
-- Automatically close tab/vim when nvim-tree is the last window in the tab
vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.java" },
  callback = function()
    vim.lsp.codelens.refresh()
  end,
})

-- -- Set specific colorscheme for certain filetypes
-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
--   pattern = { "*.py" },
--   callback = function()
--     vim.cmd "colorscheme tokyonight"
--   end,
-- })

-- This autocommand runs the function on every BufRead event
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.list" },
  callback = function()
    vim.cmd("set filetype=sh")
  end,
})
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.lds" },
  callback = function()
    vim.cmd("set filetype=c")
  end,
})

-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
--   callback = function()
--     vim.cmd [[
--       " Restore session from current working directory
--       if filereadable(getcwd() . '/.session.vim')
--         execute 'so ' . getcwd() . '/.session.vim'
--         " Switch to buffers in the session if they exist
--         if bufexists(1)
--           for l in range(1, bufnr('$'))
--             if bufwinnr(l) == -1
--               exec 'sbuffer ' . l
--             endif
--           endfor
--         endif
--       endif
--     ]]
--   end,
--   nested = true,
-- })

vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    vim.cmd "hi link illuminatedWord LspReferenceText"
  end,
})

-- Disable diagnostics for C/C++ because of LSP issues
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    if vim.bo.filetype == "c" or vim.bo.filetype == "cpp" then
      vim.diagnostic.disable()
    end
  end
})

-- vim.api.nvim_create_autocmd({ "VimLeave" }, {
--   callback = function()
--     vim.cmd [[
--       " Save session in current working directory
--       if filereadable(getcwd() . '/.session.vim')
--         execute 'mksession! ' . getcwd() . '/.session.vim'
--       endif
--     ]]
--   end,
-- })

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    local line_count = vim.api.nvim_buf_line_count(0)
    if line_count >= 5000 then
      vim.cmd "IlluminatePauseBuf"
    end
  end,
})

-- Avoid scrolling when switch buffers
-- https://vim.fandom.com/wiki/Avoid_scrolling_when_switch_buffers
vim.api.nvim_create_autocmd({ "BufLeave" }, {
  callback = function()
    if not vim.wo.diff then
      vim.b.winview = vim.fn.winsaveview()
    end
  end
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    if vim.b.winview and not vim.wo.diff then
      vim.fn.winrestview(vim.b.winview)
      vim.b.winview = nil
    end
  end
})

-- Set folding method to treesitter when treesitter is available.
-- When not available, use ident folding method.
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  callback = function()
    if require("nvim-treesitter.parsers").has_parser() then
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    else
      vim.opt.foldmethod = "indent"
    end
  end,
})

-- vim.api.nvim_create_autocmd({ "BufLeave" }, {
--   callback = function()
--     -- Save current view settings on a per-window, per-buffer basis.
--     -- create a table to store the view settings
--     if vim.w.SavedBufView == nil then
--       vim.w.SavedBufView = {}
--     end
--     -- get the current buffer number
--     local buf = vim.api.nvim_buf_get_number(0)
--     -- save the current window view
--     vim.w.SavedBufView[buf] = vim.fn.winsaveview()
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
--   callback = function()
--     -- Restore current view settings.
--     -- get the current buffer number
--     local buf = vim.api.nvim_buf_get_number(0)
--     -- check if the view settings exist for this buffer
--     if vim.w.SavedBufView ~= nil and vim.w.SavedBufView[buf] ~= nil then
--       -- get the current window view
--       local v = vim.fn.winsaveview()
--       -- check if the cursor is at the start of the file and not in diff mode
--       local atStartOfFile = v.lnum == 1 and v.col == 0
--       if atStartOfFile and not vim.o.diff then
--         -- restore the window view
--         vim.fn.winrestview(vim.w.SavedBufView[buf])
--       end
--       -- delete the view settings for this buffer
--       vim.w.SavedBufView[buf] = nil
--     end
--   end,
-- })

-- Telescope TODO:
-- enable mouse scrolling in previewer
-- vim.cmd "autocmd TelescopePreviewerLoaded setlocal mouse=a"
-- enable line numbers in previewer
-- vim.cmd "autocmd TelescopePreviewerLoaded setlocal number"
