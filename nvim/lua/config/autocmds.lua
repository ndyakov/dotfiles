-- Autocommands (translated from vimrc)

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- StatusLine color changes on insert mode
local statusline_group = augroup("StatusLineGroup", { clear = true })
autocmd("InsertEnter", {
	group = statusline_group,
	pattern = "*",
	command = "hi StatusLine guibg=#83c092 guifg=#323b3f gui=bold",
})
autocmd("InsertLeave", {
	group = statusline_group,
	pattern = "*",
	command = "hi StatusLine gui=reverse",
})

-- Timeout adjustment on cursor move
autocmd("CursorMoved", {
	pattern = "*",
	callback = function()
		vim.opt.timeoutlen = 420
		vim.opt.ttimeoutlen = 10
	end,
})

-- Return to last line when reopening file
local line_return_group = augroup("line_return", { clear = true })
autocmd("BufReadPost", {
	group = line_return_group,
	pattern = "*",
	callback = function()
		local line = vim.fn.line
		if line("'\"") > 0 and line("'\"") <= line("$") then
			vim.cmd('normal! g`"zvzz')
		end
	end,
})

-- Resize splits when window is resized
local resize_group = augroup("ResizeGroup", { clear = true })
autocmd("VimResized", {
	group = resize_group,
	pattern = "*",
	command = "wincmd =",
})

-- Source vimrc after saving (adapted for init.lua)
autocmd("BufWritePost", {
	pattern = "init.lua",
	callback = function()
		vim.cmd("source ~/.config/nvim/init.vim")
	end,
})

-- Filetype specific settings
autocmd("FileType", {
	pattern = { "javascript", "vue", "typescript", "typescriptreact", "html" },
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})

-- Vue syntax sync
autocmd("FileType", {
	pattern = "vue",
	command = "syntax sync fromstart",
})

-- Cursorline only in active window
autocmd("WinLeave", {
	pattern = "*",
	command = "set nocursorline",
})
autocmd("WinEnter", {
	pattern = "*",
	command = "set cursorline",
})

-- Git commit settings
autocmd("FileType", {
	pattern = "gitcommit",
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.textwidth = 72
	end,
})

-- Git commit diff view
autocmd("VimEnter", {
	pattern = "COMMIT_EDITMSG",
	callback = function()
		-- Save the contents of the z register
		local old_z = vim.fn.getreg("z")
		local old_z_type = vim.fn.getregtype("z")

		vim.fn.cursor(1, 0)
		local diff_start = vim.fn.search("^diff --git")

		if diff_start == 0 then
			-- There's no diff in the commit message; generate our own
			vim.fn.setreg("z", vim.fn.system("git diff --cached -M -C"))
		else
			-- Yank diff from the bottom of the commit message
			vim.cmd(":.,$yank z")
			vim.fn.cursor(1, 0)
		end

		-- Paste into a new buffer
		vim.cmd("vnew")
		vim.cmd('normal! V"zP')

		-- Restore the z register
		vim.fn.setreg("z", old_z, old_z_type)

		-- Configure the buffer
		vim.opt_local.filetype = "diff"
		vim.opt_local.swapfile = false
		vim.opt_local.modified = false
		vim.opt_local.readonly = true
		vim.cmd("silent file [Changes\\ to\\ be\\ committed]")

		-- Get back to the commit message
		vim.cmd("wincmd p")
	end,
})

-- Functions for trailing whitespace
_G.clear_trailing_ws = function()
	local save_cursor = vim.fn.getpos(".")
	vim.cmd([[%s/\s\+$//ge]])
	vim.fn.setpos(".", save_cursor)
end

_G.show_trailing_ws = function()
	vim.fn.matchadd("Error", [[\s\+$]])
end

-- Keymaps for whitespace functions
vim.keymap.set("n", "<leader>w", ":lua show_trailing_ws()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>W", ":lua clear_trailing_ws()<CR>", { noremap = true, silent = true })

-- Toggle quickfix/location list functions
_G.toggle_list = function(bufname, pfx)
	local buflist = vim.fn.execute("ls!")
	for _, bufnum in ipairs(vim.fn.split(buflist, "\n")) do
		if string.match(bufnum, bufname) then
			local num = tonumber(string.match(bufnum, "^%s*(%d+)"))
			if vim.fn.bufwinnr(num) ~= -1 then
				vim.cmd(pfx .. "close")
				return
			end
		end
	end

	if pfx == "l" and #vim.fn.getloclist(0) == 0 then
		vim.api.nvim_echo({ { "Location List is Empty.", "ErrorMsg" } }, false, {})
		return
	end

	local winnr = vim.fn.winnr()
	vim.cmd(pfx .. "open")
	if vim.fn.winnr() ~= winnr then
		vim.cmd("wincmd p")
	end
end

-- Keymaps for toggle list
vim.keymap.set("n", ",q", ':lua toggle_list("Quickfix List", "c")<CR>', { noremap = true, silent = true })
vim.keymap.set("n", ",a", ':lua toggle_list("Location List", "l")<CR>', { noremap = true, silent = true })

-- Hlsearch toggle
_G.hlstate = 0
vim.keymap.set("n", "<Leader>n", function()
	if _G.hlstate % 2 == 0 then
		vim.cmd("nohlsearch")
	else
		vim.opt.hlsearch = true
	end
	_G.hlstate = _G.hlstate + 1
	print("toggled visibility for hlsearch")
end, { noremap = true })

vim.keymap.set("i", "<Leader>n", function()
	if _G.hlstate % 2 == 0 then
		vim.cmd("nohlsearch")
	else
		vim.opt.hlsearch = true
	end
	_G.hlstate = _G.hlstate + 1
	print("toggled visibility for hlsearch")
end, { noremap = true })

