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
	"itmecho/neoterm.nvim",
	config=function()
		require('neoterm').setup({
			clear_on_run = true,
			mode = 'horizontal',
			noinsert = false
		})
	end,
	 keys = {
      { "<C-t>", "<cmd>lua require('neoterm').toggle()<CR>", desc = "Neoterm" },
    },
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
}


