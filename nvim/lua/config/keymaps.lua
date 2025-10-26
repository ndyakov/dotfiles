-- Keymaps (translated from vimrc)

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key (default is \)
vim.g.mapleader = ","

-- Disable F1 help
map("i", "<F1>", "<ESC>", opts)
map("n", "<F1>", "<ESC>", opts)
map("v", "<F1>", "<ESC>", opts)

-- Disable arrow keys
map("i", "<Left>", "<Nop>", opts)
map("i", "<Right>", "<Nop>", opts)
map("i", "<Up>", "<Nop>", opts)
map("i", "<Down>", "<Nop>", opts)
map("n", "<Left>", "<Nop>", opts)
map("n", "<Right>", "<Nop>", opts)
map("n", "<Up>", "<Nop>", opts)
map("n", "<Down>", "<Nop>", opts)
map("v", "<Left>", "<Nop>", opts)
map("v", "<Right>", "<Nop>", opts)
map("v", "<Up>", "<Nop>", opts)
map("v", "<Down>", "<Nop>", opts)

-- Map ; to : in normal and visual mode
map("n", ";", ":", { noremap = true })
map("v", ";", ":", { noremap = true })

-- Toggle spell
map("n", "<leader>s", ":set spell!<CR>", opts)

-- Tab in visual mode for indenting
map("v", "<tab>", ">gv", opts)
map("v", "<s-tab>", "<gv", opts)

-- Toggle relative numbers
map("n", "<leader>l", ":set relativenumber!<CR>", opts)

-- Select just pasted text
map("n", "<leader>v", "V`]", opts)

-- NvimTree
map("n", "<BS>", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>nf", ":NvimTreeFindFileToggle<CR>", opts)

-- Redo with U
map("n", "U", ":redo<CR>", opts)

-- Ctrl+S to save
map("n", "<C-s>", ":w<CR>", opts)
map("i", "<C-s>", "<ESC>:w<CR>", opts)
map("v", "<C-s>", "<ESC>:w<CR>", opts)

-- Splits/Windows
-- Note: Original vimrc used Mac Option+key combos (–, ≠, ˚, ∆, ˙, ¬, œ, etc.)
-- These are preserved but also adding standard alternatives

-- Create splits (Mac Option+- and Option+=)
map("n", "–", ":split<CR>", opts)
map("n", "≠", ":vsplit<CR>", opts)
-- Standard alternatives
map("n", "<leader>-", ":split<CR>", opts)
map("n", "<leader>=", ":vsplit<CR>", opts)

-- Navigation between splits (Mac Option+hjkl)
map("n", "˚", ":wincmd k<CR>", opts)
map("n", "∆", ":wincmd j<CR>", opts)
map("n", "˙", ":wincmd h<CR>", opts)
map("n", "¬", ":wincmd l<CR>", opts)
map("n", "œ", ":close<CR>", opts)
-- Standard alternatives with Ctrl
map("n", "<C-k>", ":wincmd k<CR>", opts)
map("n", "<C-j>", ":wincmd j<CR>", opts)

-- Resize splits (Mac Option+arrow keys - commenting out problematic ones)
-- map("n", "", ":res +5<CR>", opts)  -- Empty key, skipping
-- map("n", "Ô", ":res -5<CR>", opts)
-- map("n", "Ó", ":vertical resize -5<CR>", opts)
-- map("n", "Ò", ":vertical resize +5<CR>", opts)
-- Standard alternatives
map("n", "<leader>+", ":res +5<CR>", opts)
map("n", "<leader>_", ":res -5<CR>", opts)
map("n", "<leader><", ":vertical resize -5<CR>", opts)
map("n", "<leader>>", ":vertical resize +5<CR>", opts)

-- Buffer navigation
map("n", "<leader><leader>", "<C-^>", opts)
map("v", "<leader><leader>", "<C-^>", opts)
map("n", "<C-l>", ":bnext<CR>", opts)
map("n", "<C-h>", ":bprevious<CR>", opts)
map("n", "<C-q>", ":bdelete<CR>", opts)

-- Tab navigation
map("n", ",to", ":tabnew %<CR>", opts)
map("n", ",tq", ":tabclose<CR>", opts)
map("n", "[t", ":tabprevious<CR>", opts)
map("n", "]t", ":tabnext<CR>", opts)

-- Quickfix navigation
map("n", "[q", ":cprev<CR>", opts)
map("n", "]q", ":cnext<CR>", opts)

-- Location list navigation
map("n", "[a", ":lprev<CR>", opts)
map("n", "]a", ":lnext<CR>", opts)
map("n", ",aa", ":lfirst<CR>", opts)

-- Jumplist navigation
map("n", "[w", "<C-o>", opts)
map("n", "]w", "<C-i>", opts)

-- f<char> navigation
map("n", "[f", ",", opts)
map("n", "]f", ";", opts)

-- Edit vimrc
map("n", "<leader>ev", "<C-w><C-v><C-l>:e ~/.config/nvim/init.vim<CR>", opts)

-- Telescope (replacing fzf)
map("n", "<tab>", ":Telescope find_files<CR>", opts)
map("n", "<S-Tab>", ":Telescope find_files<CR>", opts) -- Shift+Tab also opens file finder
map("n", "<C-b>", ":Telescope buffers<CR>", opts)
map("n", "<F20>", ":Telescope live_grep<CR>", opts)
map("n", "<leader>f", function()
	require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
end, opts)

-- Visual mode search with Telescope
map("v", "<leader>f", function()
	local text = vim.fn.getreg("h")
	require("telescope.builtin").grep_string({ search = text })
end, opts)

-- Git (using gitsigns instead of gitgutter)
map("n", "gp", ":Gitsigns preview_hunk<CR>", opts)
map("n", "gs", ":Gitsigns stage_hunk<CR>", opts)
map("n", "gu", ":Gitsigns undo_stage_hunk<CR>", opts)
map("n", "gr", ":Gitsigns reset_hunk<CR>", opts)
map("n", "[g", ":Gitsigns prev_hunk<CR>", opts)
map("n", "]g", ":Gitsigns next_hunk<CR>", opts)

-- Go test (if using vim-go or similar)
map("v", "<leader>tf", ":GoTestFunc<CR>", opts)
map("v", "<leader>t", ":GoTest<CR>", opts)
map("n", "<leader>tf", ":GoTestFunc<CR>", opts)
map("n", "<leader>t", ":GoTest<CR>", opts)
map("n", "<leader>gd", ":GoDef<CR>", opts)

