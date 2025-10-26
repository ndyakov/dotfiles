return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Custom theme based on everforest with blue insert mode
    local everforest = require("lualine.themes.everforest")

    -- Change insert mode color to blue
    everforest.insert.a.bg = "#7fbbb3" -- Blue background for insert mode
    everforest.insert.a.fg = "#232a2e" -- Dark foreground

    require("lualine").setup({
      options = {
        theme = everforest,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}

