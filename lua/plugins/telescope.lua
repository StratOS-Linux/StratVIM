return {
    "nvim-telescope/telescope.nvim", -- TODO : Add extra keybindings
    lazy = false,
    config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
	telescope.load_extension('themes')
    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
		extensions = {
                themes = {
                    -- you can add regular telescope config
                    -- that you want to apply on this picker only
                    layout_config = {
                        horizontal = {
                            width = 0.8,
                            height = 0.7,
                        },
                    },
					persist = {
                        -- enable persisting last theme choice
                        enabled = true,

                        -- override path to file that execute colorscheme command
						-- path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua"
                    }
      },
  }
    }})

    -- telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
	keymap.set("n", "<leader>th", ":Telescope themes<CR>", {noremap = true, silent = true, desc = "Theme Switcher"})
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    end,
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "cljoly/telescope-repo.nvim" },
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
	  {'andrew-george/telescope-themes'},
    },
}
