vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0                         -- always show tabs
vim.opt.smartcase = true                        -- smart case
-- vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeout = true
vim.opt.timeoutlen = 300                        -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4                             -- the number of spaces inserted for a tab
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.number = true                           -- set numbered lines
vim.opt.laststatus = 3                          -- only the last window will always have a status line
vim.opt.showcmd = false                         -- hide (partial) command in the last line of the screen (for performance)
vim.opt.ruler = false                           -- hide the line and column number of the cursor position
vim.opt.numberwidth = 4                         -- minimal number of columns to use for the line number {default 4}
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.statuscolumn = "%s %l   "
vim.opt.wrap = false                            -- display lines as one long line
-- vim.opt.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8                       -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
vim.opt.fillchars:append({ eob = ' ' })         -- show empty lines at the end of a buffer as ` ` {default `~`}
vim.opt.shortmess:append "c"                    -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
vim.opt.whichwrap:append "<,>,[,],h,l"          -- keys allowed to move to the previous/next line when the beginning/end of line is reached
vim.opt.formatoptions:remove { "c", "r", "o" }  -- This is a sequence of letters which describes how automatic formatting is to be done
vim.opt.linebreak = true
vim.opt.winbar = "%=%f%="                       -- display the filename in the middle of the winbar
vim.opt.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<"             -- requried for checking formatting using :set list
vim.opt.diffopt:append("iwhiteall")

-- Options for kevinhwang91/nvim-ufo
vim.opt.foldcolumn = '0'                        -- disable fold column
vim.opt.foldlevel = 99                          -- open all folds by default
vim.opt.foldlevelstart = 99                     -- open all folds by default
vim.opt.foldenable = true                       -- enable folding by default
-- vim.opt.foldmethod = "manual"                   -- control folds manually

-- Function to set unique options based on filetype
local function set_tab_options(filetype, options)
  for option, value in pairs(options) do
    local cmd = string.format("autocmd FileType %s setlocal %s=%s", filetype, option, value)
    vim.cmd(cmd)
  end
end

-- Options overrides for different filetypes
set_tab_options("lua", {tabstop = 2, shiftwidth = 2})
set_tab_options("markdown", {tabstop = 2, shiftwidth = 2})

-- vim.opt.guicursor = "n:blinkon1"               -- make the cursor blink

-- vim.opt.clipboard = unnamedplus may not work correctly without the following snippet
-- if vim.fn.has('wsl') == 1 then
--     vim.g.clipboard = {
--         name = 'WslClipboard',
--         copy = {
--             ['+'] = 'clip.exe',
--             ['*'] = 'clip.exe',
--         },
--         paste = {
--             ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--             ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--         },
--         cache_enabled = 0,
--     }
-- end

-- https://vim.fandom.com/wiki/Avoid_scrolling_when_switch_buffers
-- " Retain window position when moving across buffers
-- " Save current view settings on a per-window, per-buffer basis.
-- function! AutoSaveWinView()
--     if !exists("w:SavedBufView")
--         let w:SavedBufView = {}
--     endif
--     let w:SavedBufView[bufnr("%")] = winsaveview()
-- endfunction
-- 
-- " Restore current view settings.
-- function! AutoRestoreWinView()
--     let buf = bufnr("%")
--     if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
--         let v = winsaveview()
--         let atStartOfFile = v.lnum == 1 && v.col == 0
--         if atStartOfFile && !&diff
--             call winrestview(w:SavedBufView[buf])
--         endif
--         unlet w:SavedBufView[buf]
--     endif
-- endfunction
-- 
-- " When switching buffers, preserve window view.
-- if v:version >= 700
--     autocmd BufLeave * call AutoSaveWinView()
--     autocmd BufEnter * call AutoRestoreWinView()
-- endif

-- -- Save current view settings on a per-window, per-buffer basis.
-- local function AutoSaveWinView()
--   -- create a table to store the view settings
--   if vim.w.SavedBufView == nil then
--     vim.w.SavedBufView = {}
--   end
--   -- get the current buffer number
--   local buf = vim.api.nvim_buf_get_number(0)
--   -- save the current window view
--   vim.w.SavedBufView[buf] = vim.fn.winsaveview()
-- end
--
-- -- Restore current view settings.
-- local function AutoRestoreWinView()
--   -- get the current buffer number
--   local buf = vim.api.nvim_buf_get_number(0)
--   -- check if the view settings exist for this buffer
--   if vim.w.SavedBufView ~= nil and vim.w.SavedBufView[buf] ~= nil then
--     -- get the current window view
--     local v = vim.fn.winsaveview()
--     -- check if the cursor is at the start of the file and not in diff mode
--     local atStartOfFile = v.lnum == 1 and v.col == 0
--     if atStartOfFile and not vim.o.diff then
--       -- restore the window view
--       vim.fn.winrestview(vim.w.SavedBufView[buf])
--     end
--     -- delete the view settings for this buffer
--     vim.w.SavedBufView[buf] = nil
--   end
-- end
--
-- -- When switching buffers, preserve window view.
-- -- check if the Neovim version is >= 0.5
-- if vim.version().major >= 0.5 then
--   -- use the vim.cmd function to execute vimscript commands
--   -- use single quotes to avoid escaping double quotes
--   vim.cmd('autocmd BufLeave * lua AutoSaveWinView()')
--   vim.cmd('autocmd BufEnter * lua AutoRestoreWinView()')
-- end

