return {
	"junegunn/fzf.vim",
	dependencies = { "junegunn/fzf" },
	config = function()
		-- FZF configuration
		vim.g.fzf_layout = { window = { width = 0.9, height = 0.6 } }

		-- Ag configuration (requires 'ag' to be installed: brew install the_silver_searcher)
		-- Use Ag for faster searching
		vim.g.fzf_command_prefix = ""

		-- Custom Ag command that opens in FZF
		vim.cmd([[
			command! -bang -nargs=* Ag
			  \ call fzf#vim#ag(<q-args>,
			  \                 fzf#vim#with_preview(),
			  \                 <bang>0)
		]])

		-- FZF command for file finding
		vim.cmd([[
			command! -bang -nargs=? -complete=dir FZF
			  \ call fzf#vim#files(<q-args>,
			  \                     fzf#vim#with_preview(),
			  \                     <bang>0)
		]])

		-- Buffers command
		vim.cmd([[
			command! -bang Buffers
			  \ call fzf#vim#buffers(fzf#vim#with_preview(),
			  \                       <bang>0)
		]])
	end,
}
