-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
-- vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Neovim config source mapping
keymap("n", "<leader>tr", ":luafile %<CR>", opts)

-- Better scrolling
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Scrolling without cursor movement
keymap("n", "<C-e>", "<C-e><C-e><C-e>", opts)
keymap("n", "<C-y>", "<C-y><C-y><C-y>", opts)

-- Deleting word in insert mode
keymap("i", "<C-BS>", "<C-w>", opts)
keymap("i", "<C-h>", "<C-w>", opts)

-- Jumps to newer entry in tag stack
-- Originally <C-y> is used to scroll up the file 1 line
-- <C-t> jumps to the old entry in tag stack
-- keymap("n", "<C-y>", ":ta<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Correct text copied from Windows
-- Only needed for Windows OS, required utility - dos2unix
keymap("n", "<leader>v", ":w<CR>:!dos2unix '%:p'<CR><CR>:e<CR>", opts)

-- C++ only mapping, move to the top of the current function
-- and place it at the top of the screen
-- TODO: allow this only for .cpp and .c files
-- TODO: this doesn't work when function comment has blank lines in between
-- keymap("n", "<leader>p", "{][%jw^zczO][%{jzt][%b0j", opts)
--
-- place the current function at the top of the screen, uses treesitter-textobjects plugin
-- "[m" goes the the start of the current function
-- If the cursor is on the first character of the function start, then "[m" jumps to previous function
-- So, "l" before "[m" shifts one character right of whatever function we are in
-- TODO: add a check here to see if nvim-treesitter-textobjects plugin exists
-- keymap("n", "<leader>p", "l[mzt", { silent = true, remap = true })
keymap("n", "<leader>p", "l[mj{jzt", { silent = true, remap = true })

-- Clear highlights
-- keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", "P", opts)

-- -- Marks
--https://stackoverflow.com/questions/954273/vim-scripting-preserve-cursor-position-and-screen-view-in-function-call
--https://old.reddit.com/r/vim/comments/ln2ne/any_way_to_get_and_to_also_restore_scroll/
--https://stackoverflow.com/questions/27882964/in-vim-remapping-how-do-i-capture-and-reuse-any-character
--https://old.reddit.com/r/neovim/comments/ydbxl1/help_required_how_to_map_command_to_lua_11/
--https://old.reddit.com/r/neovim/comments/kkhh65/mapping_a_key_conditionally_in_lua/
--https://old.reddit.com/r/neovim/comments/qjfxln/keymapping_with_expression/
-- keymap("n", "m", function()
--   return vim.fn[(nr2char(getchar()))]
-- end, { silent = true, expr = true })
--
-- -- Save the window view when a mark is set
-- local function save_win_view(mark)
--   vim.fn.setreg('z', vim.fn.winsaveview(), 'V')
--   vim.cmd('normal! m' .. mark)
-- end
--
-- -- Restore the window view when a mark is jumped to
-- local function restore_win_view(mark)
--   vim.cmd('normal! `' .. mark)
--   vim.fn.winrestview(vim.fn.getreg('z'))
-- end
--
-- -- Create Vimscript commands that call the Lua functions
-- vim.cmd('command! -nargs=1 SaveWinView lua save_win_view(<f-args>)')
-- vim.cmd('command! -nargs=1 RestoreWinView lua restore_win_view(<f-args>)')
--
-- -- Map the keys to call the commands
-- vim.api.nvim_set_keymap('n', 'm', ':SaveWinView v:count1<CR>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '`', ':RestoreWinView v:count1<CR>', {noremap = true, silent = true})

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- FZF vim
-- vim.api.nvim_create_user_command(
--   'ProjectFiles',
--   "call fzf#vim#files('~/.config/nvim/', <bang>0)",
--   {bang = true}
-- )

-- FZF-LUA
-- -- grep resume
-- -- keymap("n", "<leader>r", "<cmd>lua require('fzf-lua').live_grep_resume()<CR>", opts)
-- -- find files
-- keymap("n", "<leader>ff", "<cmd>lua require('fzf-lua').git_files()<CR>", opts)
-- -- find all files
-- keymap("n", "<leader>faf", "<cmd>lua require('fzf-lua').files()<CR>", opts)
-- -- find string
-- -- keymap("n", "<leader>fs", "<cmd>lua require('fzf-lua').grep_project()<CR>", opts)
-- keymap("n", "<leader>fs", ":FzfLua grep_project --filename<CR>", opts)
-- -- find word under cursor
-- keymap("n", "<leader>fw", "<cmd>lua require('fzf-lua').grep_cword()<CR>", opts)
-- find functions in a file
keymap("n", "<leader>fn", "<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>", opts)
-- -- find keymaps
-- keymap("n", "<leader>fk", "<cmd>lua require('fzf-lua').keymaps()<CR>", opts)
-- -- find buffers
-- keymap("n", "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<CR>", opts)

-- FZF-VIM
-- example config in lua: https://github.com/creativenull/dotfiles/blob/930b79cb0d07b552b4b8e6b3a7db14f1097d049f/config/nvim/lua/user/fzf.lua#L3-L11
-- -- find files
-- keymap("n", "<leader>mf", ":GFiles<CR>", opts)
-- -- find all files
-- keymap("n", "<leader>maf", ":Files<CR>", opts)
-- -- -- find string
-- keymap("n", "<leader>ms", ":Rg<CR>", opts)
-- -- find word under cursor
-- keymap("n", "<leader>mw", ":Rg <C-R><C-W><CR>", opts)
-- -- find functions in a file
-- keymap("n", "<leader>fn", "<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>", opts)
-- -- find keymaps
-- keymap("n", "<leader>fk", "<cmd>lua require('fzf-lua').keymaps()<CR>", opts)
-- find buffers
-- keymap("n", "<leader>mb", "Buffers<CR>", opts)

-- Telescope
-- grep_string for fuzzy - search params: match case, include files, exclude files, use_regex, word_match
-- resume
-- keymap("n", "<leader>r", ":Telescope resume<CR>", opts)
-- find files
keymap("n", "<leader>ff", ":Telescope git_files<CR>", opts)
-- find all files
keymap("n", "<leader>faf", ":Telescope find_files<CR>", opts)
-- find string
keymap("n", "<leader>fs", ":lua require'telescope.builtin'.grep_string{use_regex = false, search = ''}<Left><Left>", opts)
-- keymap("n", "<leader>fs", ":lua require'telescope.builtin'.grep_string{use_regex = false, word_match = '-w', search = ''}<Left><Left>", opts)
-- keymap("n", "<leader>fs", ":Telescope live_grep<CR>", opts)          -- ripgrep which does not do fuzzy search
-- keymap("n", "<leader>fs", ":Telescope grep_string search=<CR>", opts)   -- fuzzy searches but no regex
-- find word under cursor
keymap("n", "<leader>fw", ":Telescope grep_string<CR>", opts)   -- matches case and whole word, no regex
-- find project
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
-- NOTE: Listing treesitter symbols with telescope doesn't work within git worktrees.
-- As a workaround, use FZF-Lua functionality.
-- -- find functions in a file
-- keymap("n", "<leader>fn", "<cmd>lua require'telescope.builtin'.treesitter({ symbols = { 'function', } })<CR>", opts)
-- find keymaps
keymap("n", "<leader>fk", ":Telescope keymaps<CR>", opts)
-- find buffers
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
-- switch git worktree
keymap("n", "<leader>fg", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees(require('telescope.themes').get_dropdown({ previewer = false}))<CR>", opts)

-- TODO: telescope buffer manager
-- TODO: vscode timeline
--
-- keymap("n", "<leader>fr", ":Telescope lsp_references<CR>", opts)
-- keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files({layout_strategy='vertical',layout_config={width=0.9}})<cr>", opts)
-- telescope.builtin.lsp_incoming_calls()
-- telescope.builtin.lsp_outgoing_calls() -- optional
-- telescope.builtin.lsp_definitions()
-- telescope.builtin.lsp_workspace_symbols()
-- telescope.builtin.lsp_dynamic_workspace_symbols() -- dynamic?
-- telescope.builtin.jumplist()
-- telescope.builtin.registers()
-- telescope.builtin.marks()
-- telescope.builtin.colorscheme()
-- telescope.builtin.help_tags() -- optional
-- telescope.builtin.search_history()
-- telescope.builtin.command_history()
-- telescope.builtin.oldfiles()
-- telescope.builtin.quickfixhistory() -- optional
-- telescope.builtin.quickfix()
--
-- telescope.builtin.lsp_document_symbols() for Clang LSP (only if present in compile_commands.json)
-- global variables (as variables) and functions (as function)
-- lists in order: symbol name, line number (optional), type
--
-- telescope.builtin.treesitter() lists the following for C++
-- local/global variables (as var), functions (as function), and incomplete list of function parameters (as parameter)
-- lists in order: symbol name, line number (optional), type
keymap("n", "<leader>ft", "<cmd>lua require'telescope.builtin'.treesitter(require('telescope.themes').get_dropdown({ previewer = true, symbols = { 'function' } }))<CR>", opts)
--
-- telescope.builtin.current_buffer_fuzzy_find()
--
-- telescope.defaults.file_ignore_patterns

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- Lsp Formatter
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-- Gitsigns
-- Navigation
keymap('n', ']c', '<cmd>lua require("gitsigns").next_hunk()<CR>', opts)
keymap('n', '[c', '<cmd>lua require("gitsigns").prev_hunk()<CR>', opts)
-- Actions
keymap('n', '<leader>hs', '<cmd>lua require("gitsigns").stage_hunk()<CR>', opts)
keymap('n', '<leader>hr', '<cmd>lua require("gitsigns").reset_hunk()<CR>', opts)
keymap('n', '<leader>hS', '<cmd>lua require("gitsigns").stage_buffer()<CR>', opts)
keymap('n', '<leader>hu', '<cmd>lua require("gitsigns").undo_stage_hunk()<CR>', opts)       -- undo last staged hunk
keymap('n', '<leader>hR', '<cmd>lua require("gitsigns").reset_buffer()<CR>', opts)
keymap('n', '<leader>hp', '<cmd>lua require("gitsigns").preview_hunk_inline()<CR>', opts)
keymap('n', '<leader>hb', '<cmd>lua require("gitsigns").blame_line()<CR>', opts)
keymap('n', '<leader>tb', '<cmd>lua require("gitsigns").toggle_current_line_blame()<CR>', opts)
keymap('n', '<leader>hd', '<cmd>lua require("gitsigns").diffthis()<CR>', opts)              -- diff with index
keymap('n', '<leader>hD', '<cmd>lua require("gitsigns").diffthis("~")<CR>', opts)           -- diff with working tree
keymap('n', '<leader>td', '<cmd>lua require("gitsigns").toggle_deleted()<CR>', opts)        -- toggle display of deleted lines
-- Text object
keymap({'o', 'x'}, 'ih', ':<C-U>lua require("gitsigns").select_hunk()<CR>', opts)

-- Diffview
keymap('n', '<leader>hh', ':DiffviewOpen<CR>', opts)        -- toggle display of deleted lines

-- kevinhwang91/nvim-hlslens
keymap('n', 'n', '<cmd>execute("normal! " . v:count1 . "n")<CR><Cmd>lua require("hlslens").start()<CR>', opts)
keymap('n', 'N', '<cmd>execute("normal! " . v:count1 . "N")<CR><Cmd>lua require("hlslens").start()<CR>', opts)
keymap('n', '*', '*<cmd>lua require("hlslens").start()<CR>', opts)
keymap('n', '#', '#<cmd>lua require("hlslens").start()<CR>', opts)
keymap('n', 'g*', 'g*<cmd>lua require("hlslens").start()<CR>', opts)
keymap('n', 'g#', 'g#<cmd>lua require("hlslens").start()<CR>', opts)
keymap('n', '<leader>l', '<cmd>noh<CR>', opts)

-- harpoon
keymap('n', '<leader>jm', '<cmd>lua require("harpoon.mark").add_file()<CR>', opts)
keymap('n', '<leader>jl', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
keymap('n', '<leader>ja', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', opts)
keymap('n', '<leader>js', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', opts)
keymap('n', '<leader>jd', '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', opts)
keymap('n', '<leader>jf', '<cmd>lua require("harpoon.ui").nav_file(4)<CR>', opts)
keymap('n', '<leader>jg', '<cmd>lua require("harpoon.ui").nav_file(5)<CR>', opts)
-- keymap('n', '<leader>h', '<cmd>lua require("harpoon.ui").nav_next()', opts)
-- keymap('n', '<leader>h', '<cmd>lua require("harpoon.ui").nav_prev()', opts)

-- zen-mode
keymap("n", "<leader>z", ":ZenMode<CR>", opts)

-- vim-interestingwords
keymap("n", "<leader>k", ":call InterestingWords('n')<CR>", opts)
keymap("v", "<leader>k", ":call InterestingWords('v')<CR>", opts)
keymap("n", "<leader>K", ":call UncolorAllWords()<CR>", opts)
keymap("n", "<leader>n", ":call WordNavigation(1)<CR>", opts)
keymap("n", "<leader>N", ":call WordNavigation(0)<CR>", opts)
