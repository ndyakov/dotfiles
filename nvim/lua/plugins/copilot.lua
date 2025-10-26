return {
	"github/copilot.vim",
	event = "InsertEnter", -- Load when entering insert mode
	config = function()
		-- Copilot uses Tab by default to accept suggestions
		-- This is already configured by the plugin

		-- Optional: Disable tab mapping if you want to use a different key
		-- vim.g.copilot_no_tab_map = true
		-- Then create your own mapping:
		-- vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
		--   expr = true,
		--   replace_keycodes = false
		-- })

		-- Optional: Configure filetypes to enable/disable
		-- vim.g.copilot_filetypes = {
		--   ["*"] = false,
		--   ["python"] = true,
		--   ["javascript"] = true,
		-- }

		-- Keybindings for Copilot commands
		vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>", { noremap = true, silent = true, desc = "Copilot enable" })
		vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>", { noremap = true, silent = true, desc = "Copilot disable" })
		vim.keymap.set("n", "<leader>cs", ":Copilot status<CR>", { noremap = true, silent = true, desc = "Copilot status" })
		vim.keymap.set("n", "<leader>cp", ":Copilot panel<CR>", { noremap = true, silent = true, desc = "Copilot panel" })
	end,
}

