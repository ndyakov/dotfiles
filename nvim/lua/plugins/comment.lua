return {
	"numToStr/Comment.nvim",
	event = "BufReadPost",
	config = function()
		require("Comment").setup({
			-- Add comment string for languages not supported by treesitter
			padding = true, -- Add a space between comment and the line
			sticky = true, -- Whether the cursor should stay at its position
			ignore = nil, -- Lines to be ignored while (un)comment

			-- LHS of toggle mappings in NORMAL mode
			toggler = {
				line = "gcc", -- Line-comment toggle keymap
				block = "gbc", -- Block-comment toggle keymap
			},

			-- LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				line = "gc", -- Line-comment keymap
				block = "gb", -- Block-comment keymap
			},

			-- LHS of extra mappings
			extra = {
				above = "gcO", -- Add comment on the line above
				below = "gco", -- Add comment on the line below
				eol = "gcA", -- Add comment at the end of line
			},

			-- Enable keybindings
			mappings = {
				basic = true,
				extra = true,
			},
		})
	end,
}

