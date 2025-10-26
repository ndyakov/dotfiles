return {
	"augmentcode/augment.vim",
	config = function()
		-- Configure workspace folders for Augment
		-- Add your project directories here for better context
		vim.g.augment_workspace_folders = {
			vim.fn.expand("~/personal"), -- Personal projects
			-- Add more workspace folders as needed:
			-- vim.fn.expand("~/work"),
			-- "/path/to/your/project",
		}

		-- Optional: Disable tab mapping if you want to use a different key
		-- vim.g.augment_disable_tab_mapping = true

		-- Optional: Disable completions entirely
		-- vim.g.augment_disable_completions = true

		-- Keybindings for Augment chat
		vim.keymap.set("n", "<leader>ac", ":Augment chat<CR>", { noremap = true, silent = true, desc = "Augment chat" })
		vim.keymap.set("v", "<leader>ac", ":Augment chat<CR>", { noremap = true, silent = true, desc = "Augment chat with selection" })
		vim.keymap.set("n", "<leader>an", ":Augment chat-new<CR>", { noremap = true, silent = true, desc = "Augment new chat" })
		vim.keymap.set("n", "<leader>at", ":Augment chat-toggle<CR>", { noremap = true, silent = true, desc = "Augment toggle chat" })
		vim.keymap.set("n", "<leader>as", ":Augment status<CR>", { noremap = true, silent = true, desc = "Augment status" })
	end,
}

