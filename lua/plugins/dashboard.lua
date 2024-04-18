return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = { {'nvim-tree/nvim-web-devicons'}},
  config = function()
local db = require("dashboard")

db.setup {
theme='doom',
    hide = {
	statusline,    -- hide statusline default is true
	tabline,       -- hide the tabline
	winbar       -- hide winbar
},
preview = {
  command,       -- preview command
  file_path,     -- preview file path
  file_height,   -- preview file height
  file_width    -- preview file width
},
    config = {
        header ={
        "","","",
	"███████ ████████ ██████   █████  ████████ ██    ██ ██ ███    ███ ",
	"██         ██    ██   ██ ██   ██    ██    ██    ██ ██ ████  ████ ",
	"███████    ██    ██████  ███████    ██    ██    ██ ██ ██ ████ ██ ",
	"     ██    ██    ██   ██ ██   ██    ██     ██  ██  ██ ██  ██  ██ ",
	"███████    ██    ██   ██ ██   ██    ██      ████   ██ ██      ██ ",
  "","","","",
  },
    center = {
		{
			icon = '  ',
			icon_hl = 'Title',
			desc = "Find Files",
			desc_hl = 'String',
			key = '0',
			keymap = '',
			key_hl = 'Number',
			action = ":lua require('telescope.builtin').find_files({layout_strategy='vertical',layout_config={width=0.9}})",
		},
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Find Recent Files',
        desc_hl = 'String',
        key = '1',
        keymap = '',
        key_hl = 'Number',
        action = ":lua require('telescope.builtin').oldfiles({layout_strategy='vertical',layout_config={width=0.9}})",
      },
     {
	icon = '  ',
        icon_hl = 'Title',
	desc = "Change Dashboard settings",
        desc_hl = 'String',
	key = '2',
	keymap = '',
	key_hl = 'Number',
	action = ':edit ~/.config/nvim/lua/plugins/dashboard.lua'
      },
      {
	      icon = '  ',
              icon_hl = 'Title',
	      desc = "Modify Neovim Plugins",
	      desc_hl = 'String',
	      key = '3',
	      keymap = '',
	      key_hl = 'Number',
	      action = ":lua require('telescope.builtin').find_files({layout_strategy='vertical',layout_config={width=0.7},cwd='~/.config/nvim/lua/plugins'})", -- TODO: this needs tobe changed
					},
      {
        icon = '  ',
	icon_hl = 'Title',
	desc = "Modify Neovim Setup",
	desc_hl = 'String',
	key = '4',
	key_hl = 'Number',
	action = ':edit ~/.config/nvim/init.lua',
      },
		{
	      icon = '  ',
              icon_hl = 'Title',
	      desc = 'Change StratVIM Theme',
	      desc_hl = 'String',
	      key = '5',
	      key_hl = 'Number',
	      action = ':Huez',
		},
      {
	--      icon = '☁  ',
			icon = "  ",
              icon_hl = 'Title',
	      desc = 'Modify Editor Tooling',
	      desc_hl = 'String',
	      key = '6',
	      key_hl = 'Number',
	      action = ':Mason',
      },
      {
	      icon = '  ',
	      icon_hl = 'Title',
	      desc = "Open Plugins Setup",
	      desc_hl = 'String',
	      key = '7',
	      key_hl = 'Number',
	      action = ":Lazy",
      },

},
  hide={
	  shortcuts,
	  tabline,
	  winbar
  },
	footer = function()
		local info = {}
		local fortune = require('fortune').get_fortune()
		info[1] =" "
		info[2] = " "
		info[3] = "Made with   by the StratOS Team"
		local footer = vim.list_extend(info,fortune)
		return footer
	end
    },
}
	end
}
