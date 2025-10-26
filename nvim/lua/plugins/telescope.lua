return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          height = 0.9,
          width = 0.9,
          preview_width = 0.6,
        },
        mappings = {
          i = {
            ["<C-b>"] = function(prompt_bufnr)
              local actions = require("telescope.actions")
              local action_state = require("telescope.actions.state")
              local picker = action_state.get_current_picker(prompt_bufnr)
              local multi_selection = picker:get_multi_selection()

              if #multi_selection > 0 then
                actions.send_selected_to_qflist(prompt_bufnr)
                actions.open_qflist(prompt_bufnr)
              else
                actions.send_to_qflist(prompt_bufnr)
                actions.open_qflist(prompt_bufnr)
              end
            end,
            ["<C-t>"] = require("telescope.actions").select_tab,
            ["<C-x>"] = require("telescope.actions").select_horizontal,
            ["<C-v>"] = require("telescope.actions").select_vertical,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = false,
        },
      },
    })

    -- Note: Keymaps are defined in lua/config/keymaps.lua
    -- Using FZF for file finding, Telescope for quickfix/grep
  end,
}

