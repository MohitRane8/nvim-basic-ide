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
-- Scrolling without cursor movement
-- keymap("n", "<C-j>", "<C-e><C-e><C-e>", opts)
-- keymap("n", "<C-k>", "<C-y><C-y><C-y>", opts)

-- Jumps to newer entry in tag stack
-- Originally <C-y> is used to scroll up the file 1 line
-- <C-t> jumps to the old entry in tag stack
-- keymap("n", "<C-y>", ":ta<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
-- keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", "P", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
-- find files
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
-- find string
keymap("n", "<leader>fs", ":Telescope live_grep<CR>", opts)
-- find word under cursor
keymap("n", "<leader>fw", ":Telescope grep_string<CR>", opts)
-- find project
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
-- find functions in a file
keymap("n", "<leader>fn", "<cmd>lua require'telescope.builtin'.treesitter({ symbols = { 'function', } })<CR>", opts)
-- find keymaps
keymap("n", "<leader>fk", ":Telescope keymaps<CR>", opts)
-- find buffers
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
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
-- telescope.builtin.oldfiles() -- optional
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

-- C/C++
-- " C++ function yank/delete/change/select
-- " a = around, i = in
-- nnoremap <silent> yaf ][jVk%{jy
-- nnoremap <silent> yif ][kVj%jy
-- nnoremap <silent> daf ][jVk%{jx
-- nnoremap <silent> dif ][kVj%jd
-- nnoremap <silent> cif ][kVj%jdO
-- nnoremap <silent> vaf ][jVk%{jv
-- 
-- " C++ function expand and move to top
-- nnoremap <C-h> {][%zczO{jzt]]
-- " nnoremap <silent!> <C-h> {][%zczO{jzozt]]
-- " nnoremap <C-h> {][%zczO{jzOzt]]
