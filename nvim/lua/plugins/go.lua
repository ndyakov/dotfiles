return {
  "fatih/vim-go",
  ft = "go",
  build = ":GoUpdateBinaries",
  config = function()
    -- Go settings
    vim.g.go_fmt_command = "goimports"
    vim.g.go_def_mode = "gopls"
    vim.g.go_info_mode = "gopls"
  end,
}

