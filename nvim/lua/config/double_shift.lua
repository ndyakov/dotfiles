-- Double Shift detection for opening file finder (like IntelliJ/GoLand)
--
-- Since Neovim cannot detect raw modifier key presses, we implement this by:
-- 1. Mapping Shift+Shift as a double-tap of Shift+Space
-- 2. Using a timer to detect rapid succession
--
-- Usage: Press Shift+Space twice quickly (within 300ms)
-- This mimics IntelliJ's Shift+Shift behavior

local M = {}

local last_shift_time = 0
local double_shift_timeout = 300 -- milliseconds (same as IntelliJ default)

-- Function to get current time in milliseconds
local function get_time_ms()
	return vim.loop.now()
end

-- Function to handle shift press detection
local function on_shift_trigger()
	local current_time = get_time_ms()
	local time_diff = current_time - last_shift_time

	if time_diff < double_shift_timeout and last_shift_time > 0 then
		-- Double shift detected! Open file finder
		last_shift_time = 0 -- Reset to prevent triple-tap
		require("telescope.builtin").find_files()
		return true
	else
		-- First shift press - just record the time
		last_shift_time = current_time
		return false
	end
end

-- Setup function to create the keymaps
function M.setup()
	-- Map Shift+Space to detect double-shift
	-- User presses Shift+Space twice quickly to trigger file finder
	vim.keymap.set("n", "<S-Space>", function()
		local triggered = on_shift_trigger()
		if not triggered then
			-- If not a double-tap, insert a space (normal Shift+Space behavior)
			-- Actually, in normal mode we don't want to insert anything
			-- So we just do nothing on first press
			return ""
		end
	end, {
		noremap = true,
		silent = true,
		expr = true,
		desc = "Double Shift+Space to open file finder (like IntelliJ Shift+Shift)",
	})

	-- Also map in insert mode
	vim.keymap.set("i", "<S-Space>", function()
		local triggered = on_shift_trigger()
		if not triggered then
			-- If not a double-tap, insert a space (normal behavior)
			return " "
		else
			-- Exit insert mode and open finder
			vim.cmd("stopinsert")
			return ""
		end
	end, {
		noremap = true,
		silent = true,
		expr = true,
		desc = "Double Shift+Space to open file finder (like IntelliJ Shift+Shift)",
	})

	-- Print setup message
	vim.notify(
		"Double-Shift enabled: Press Shift+Space twice quickly to open file finder (like IntelliJ)",
		vim.log.levels.INFO
	)
end

return M

