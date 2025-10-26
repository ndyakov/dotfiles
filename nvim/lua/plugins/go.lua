return {
  "fatih/vim-go",
  ft = "go",
  build = ":GoUpdateBinaries",
  config = function()
    -- Go settings
    vim.g.go_fmt_command = "goimports"
    vim.g.go_def_mode = "gopls"
    vim.g.go_info_mode = "gopls"

    -- Keymaps for Go
    vim.keymap.set("n", "<leader>gd", ":GoDef<CR>", { buffer = true, silent = true })
    vim.keymap.set("n", "<leader>t", ":GoTest<CR>", { buffer = true, silent = true })
    vim.keymap.set("n", "<leader>tf", ":GoTestFunc<CR>", { buffer = true, silent = true })
    vim.keymap.set("v", "<leader>t", ":GoTest<CR>", { buffer = true, silent = true })
    vim.keymap.set("v", "<leader>tf", ":GoTestFunc<CR>", { buffer = true, silent = true })
  end,
}

