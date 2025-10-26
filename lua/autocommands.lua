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
    vim.opt_local.spell = false
  end,
})
-- Automatically close tab/vim when nvim-tree is the last window in the tab
vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

-- -- tristone13th/lspmark.nvim
-- vim.api.nvim_create_autocmd({ "DirChanged" }, {
--     callback = require("lspmark.bookmarks").load_bookmarks,
--     pattern = { "*" },
-- })

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

-- This autocommand runs the function on every BufRead event
-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
vim.api.nvim_create_autocmd({ "BufReadPre" }, {
  pattern = { "lfrc" },
  callback = function()
    vim.cmd("set filetype=sh")
  end,
})
vim.api.nvim_create_autocmd({ "BufReadPre" }, {
  pattern = { "*.list" },
  callback = function()
    vim.cmd("set filetype=asm")
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

-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
--   callback = function()
--     vim.cmd "hi link illuminatedWord LspReferenceText"
--   end,
-- })

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

-- Create an autocommand group
-- local augroup = vim.api.nvim_create_augroup("LargeFile", { clear = true })

-- Define the autocommand
-- vim.api.nvim_create_autocmd("BufReadPre", {
-- -- vim.api.nvim_create_autocmd("BufReadPost", {
--   -- group = augroup,
--   pattern = "*.list",
--   callback = function()
--     -- vim.cmd("set filetype=c")
--     local stats = vim.loop.fs_stat(vim.api.nvim_buf_get_name(0))
--     if stats and stats.size > 100000 then  -- 100 KB, Adjust the size threshold as needed
--       -- vim.b.large_buf = true
--       -- vim.cmd("IndentBlanklineDisable")  -- If using indent-blankline.nvim
--       -- vim.cmd("HlSearchLensDisable")  -- If using hlsearch-lens.nvim
--       vim.cmd("TSDisable")  -- If using hlsearch-lens.nvim
--       -- vim.cmd("syntax on")
--       -- vim.lsp.stop_client(vim.lsp.get_active_clients())
--     end
--   end,
-- })

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

-- Disabled the following after installing kevinhwang91/nvim-ufo plugin
-- -- Set folding method to treesitter when treesitter is available.
-- -- When not available, use indent folding method.
-- vim.api.nvim_create_autocmd({ "BufReadPost" }, {
--   callback = function()
--     if require("nvim-treesitter.parsers").has_parser() then
--       vim.opt.foldmethod = "expr"
--       vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
--     else
--       vim.opt.foldmethod = "indent"
--     end
--   end,
-- })

-- Open man/help pages in vertical split instead of the default horizontal split
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  command = "vert bo wincmd L"
})

-- Custom winbar for certain file types
-- For code files, barbecue.nvim will be used for winbar.
-- For filetypes excluded by barbecue.nvim, the default winbar set in options.lua will be used.
-- For the following filetypes, custom titles in winbar would be used.
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local winid = vim.api.nvim_get_current_win()

    if vim.bo.filetype == "NvimTree" then
      vim.wo[winid].winbar = "%=File Explorer%="
    elseif vim.bo.filetype == "DiffviewFiles" then
      vim.wo[winid].winbar = "%=Source Control%="
    elseif vim.bo.filetype == "DiffviewFileHistory" then
      vim.wo[winid].winbar = "%=File History%="
    elseif vim.bo.filetype == "copilot-chat" then
      vim.wo[winid].winbar = "%=Copilot Chat%="
    end
  end,
})

-- Disable status column for certain file types
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.filetype == "NvimTree" or vim.bo.filetype == "DiffviewFiles" then
      vim.opt.statuscolumn = ""
    end
  end,
})

-- User Commands from user defined functions
local userfunctions = require('userfunctions')

-- Creates a new tab page to show diff between code/text.
-- Usage:
--    1. Select text A and copy it in default register.
--    2. Select text B and call CheckDiff user command.
--    This will create a new tab page and show diff A <--> B
vim.api.nvim_create_user_command(
  'CheckDiff',
  function(opts)
    userfunctions.check_diff(opts.line1, opts.line2)
  end,
  { range = true }
)

vim.api.nvim_create_user_command(
  'ConvertAsciiToHex',
  function()
    userfunctions.ascii_to_hex()
  end,
  { range = true }
)

vim.api.nvim_create_user_command(
  'ConvertHexToAscii',
  function()
    userfunctions.hex_to_ascii()
  end,
  { range = true }
)

vim.api.nvim_create_user_command(
  'ConvertDecimalToHex',
  function()
    userfunctions.dec_to_hex()
  end,
  { range = true }
)

vim.api.nvim_create_user_command(
  'ConvertHexToDecimal',
  function()
    userfunctions.hex_to_dec()
  end,
  { range = true }
)

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
