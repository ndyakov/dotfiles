return {
	"github/copilot.vim",
	event = "InsertEnter", -- Load when entering insert mode
	config = function()
		-- Copilot uses Tab by default to accept suggestions
		-- Also add Shift+Enter as an alternative

		-- Map Shift+Enter to accept Copilot suggestion
		vim.keymap.set("i", "<S-CR>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
			silent = true,
			desc = "Accept Copilot suggestion",
		})

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

