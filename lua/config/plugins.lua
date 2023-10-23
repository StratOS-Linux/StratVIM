return{ 
{
    "nvim-tree/nvim-tree.lua",
    cmd = {
      "NvimTreeOpen",
     "NvimTreeClose",
      "NvimTreeToggle",
      "NvimTreeFindFile",
      "NvimTreeFindFileToggle",
    },
    keys = {
      { "<C-e>", "<cmd>lua require('nvim-tree.api').tree.toggle()<CR>", desc = "NvimTree" },
    },
    config = function()
	    require("nvim-tree").setup()
	end,
},

 {
     "nyoom-engineering/oxocarbon.nvim",
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({ default = true })
    end,
  },
  {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',

  dependencies = { {'nvim-tree/nvim-web-devicons'}}
},

 {
	 'nvim-lualine/lualine.nvim',
	 dependencies={{ 'nvim-lualine/lualine.nvim'}},
	 config=function()
		 require('lualine').setup{
			 options={theme = 'horizon'}
		 }
	end
},
 { "nvim-lua/plenary.nvim" },
{
    "chrishrb/gx.nvim",
    event = { "BufEnter" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true, -- default settings

    -- you can specify also another config if you want
    config = function() require("gx").setup {
      open_browser_app = "os_specific", -- specify your browser app; default for macOS is "open", Linux "xdg-open" and Windows "powershell.exe"
      open_browser_args = { "--background" }, -- specify any arguments, such as --background for macOS' "open".
      handlers = {
        plugin = true, -- open plugin links in lua (e.g. packer, lazy, ..)
        github = true, -- open github issues
        brewfile = true, -- open Homebrew formulaes and casks
        package_json = true, -- open dependencies from package.json
        search = true, -- search the web/selection on the web if nothing else is found
      },
      handler_options = {
        search_engine = "google", -- you can select between google, bing, duckduckgo, and ecosia
      },
    } end,
  },
    {
    "nvim-telescope/telescope.nvim", -- TODO : Add extra keybindings
    lazy = false,
    config = function()
    end,
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "cljoly/telescope-repo.nvim" },
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
    },
     { "nvim-lua/popup.nvim" },
      {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    config = function()
	    require("nvim-treesitter.install").prefer_git = true,
	    require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
    end,
    dependencies = {
      "hiphish/rainbow-delimiters.nvim",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-textsubjects",
    },
  },
  {
	  "hrsh7th/nvim-cmp", -- TODO : Work on nvim completions
 	  event = "InsertEnter",
	    dependencies = {
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-calc",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim", -- TODO : Not working. Yet to fix.
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
	    vim.api.nvim_set_keymap(
  "n",
  "<space>t",
  ":Telescope file_browser<CR>",
  { noremap = true }
)
    end
},

{
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim",        -- optional
    "ibhagwan/fzf-lua",              -- optional
  },
  config = function()
	  -- init.lua
	local neogit = require('neogit')
	neogit.setup {}
   end,
   cmd = {
	   'Neogit'
   },
},
 {'akinsho/toggleterm.nvim',
 config = function()
		require("toggleterm").setup{
			direction = 'float',
			border = 'single'
		}
	end,
	cmd = {
      "ToggleTerm",
      "TermExec",
      "ToggleTermToggleAll",
      "ToggleTermSendCurrentLine",
      "ToggleTermSendVisualLines",
      "ToggleTermSendVisualSelection",
    },	 keys = {
      { "<C-t>", "<cmd>lua require('toggleterm').toggle()<CR>", desc = "Toggle Terminal Window" },
    },
 },
--  {
--       'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',
--       config = function()
--         local colors = {
--           Red = '#EF6D6D',
--           Orange = '#FFA645',
--           Yellow = '#EDEF56',
--           Green = '#6AEF6F',
--           Cyan = '#78E6EF',
--           Blue = '#70A4FF',
--           Violet = '#BDB2EF',
--         }
--         require('pynappo.theme').set_rainbow_colors('RainbowDelimiter', colors) -- just a helper function that sets the highlights with the given prefix
--         local rainbow_delimiters = require('rainbow-delimiters')
--
--         vim.g.rainbow_delimiters = {
--           strategy = {
--             [''] = rainbow_delimiters.strategy['global'],
--             vim = rainbow_delimiters.strategy['local'],
--           },
--           query = {
--             [''] = 'rainbow-delimiters',
--           },
--           highlight = {
--             'RainbowDelimiterRed',
--             'RainbowDelimiterYellow',
--             'RainbowDelimiterOrange',
--             'RainbowDelimiterGreen',
--             'RainbowDelimiterBlue',
--             'RainbowDelimiterCyan',
--             'RainbowDelimiterViolet',
--           },
--         }
--       end
--     },
--  {
--    "lukas-reineke/indent-blankline.nvim",
--         event = { "VeryLazy" },
--         config = function()
-- 	      local hl_name_list = {
--         'RainbowDelimiterRed',
--         'RainbowDelimiterYellow',
--         'RainbowDelimiterOrange',
--         'RainbowDelimiterGreen',
--         'RainbowDelimiterBlue',
--         'RainbowDelimiterCyan',
--         'RainbowDelimiterViolet',
--       }
--             require('ibl').setup({
-- 		    scope = {
-- 			    enabled = true,
-- 			    show_start = false,
-- 			    highlight = hl_name_list
-- 	    }
--     })
--         end
-- },
	{
	    'windwp/nvim-autopairs',
	    event = "InsertEnter",
	    opts = {} -- this is equalent to setup({}) function
	},
}
