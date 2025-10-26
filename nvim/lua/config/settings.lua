-- Neovim Settings (translated from vimrc)

local opt = vim.opt
local g = vim.g

-- Disable netrw (using nvim-tree instead)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Basic settings
opt.compatible = false
opt.syntax = "on"
opt.termguicolors = true

-- Backup and swap files
opt.backupdir = vim.fn.expand("~/.vim/backup")
opt.directory = vim.fn.expand("~/.vim/backup")

-- UI settings
opt.showtabline = 1
opt.cursorline = true
opt.visualbell = false
opt.title = false
opt.showmode = false
opt.number = true
opt.relativenumber = false
opt.laststatus = 2

-- Performance
opt.cursorcolumn = false
opt.scrolloff = 15  -- Changed from 5 to 15 (from end of vimrc)
opt.scrolljump = 5
opt.synmaxcol = 320

-- Indentation
opt.smartindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

-- Backspace behavior
opt.backspace = { "indent", "eol", "start" }

-- Search
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- Splits
opt.fillchars = { vert = "┃" }
opt.splitbelow = true

-- Buffers
opt.hidden = true
opt.switchbuf = "usetab"

-- List chars
opt.list = true
opt.listchars = {
	nbsp = "⦸",
	tab = "▸ ",
	eol = "¬",
	trail = "·",
	precedes = "«",
	extends = "»",
}

-- Timeouts
opt.timeoutlen = 1000
opt.ttimeoutlen = 100

-- Shortmess
opt.shortmess:append("A")
opt.shortmess:append("I")
opt.shortmess:append("c")
opt.shortmess:append("s")
opt.shortmess:append("a")

-- Misc
opt.virtualedit = "block"
opt.autoread = true
opt.whichwrap:append("<,>,h,l")
opt.colorcolumn = "100"

-- Completion options (for nvim-cmp)
opt.completeopt = { "menu", "menuone", "noselect" }
opt.pumheight = 10 -- Max items in completion menu

-- Filetype
vim.cmd("filetype plugin indent on")

