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
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
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
  config = function()
    require('dashboard').setup {
      -- config
      config = {
  header ={
  "██      ██    ██  ██████  ██    ██ ██ ███    ███",
  "██      ██    ██ ██       ██    ██ ██ ████  ████",
  "██      ██    ██ ██   ███ ██    ██ ██ ██ ████ ██",
  "██      ██    ██ ██    ██  ██  ██  ██ ██  ██  ██",
  "███████  ██████   ██████    ████   ██ ██      ██",
  ""
  },-- type is table def
  hide={
	  shortcuts,
	  tabline,
	  winbar
  },
  footer = {"","","Made with ♥  by LUGVITC"}

}

    }
  end,
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
    "nvim-telescope/telescope.nvim",
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
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
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
}


