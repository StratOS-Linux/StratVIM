local db = require("dashboard")

db.setup {
theme='doom',
    hide = {
  statusline,    -- hide statusline default is true
  tabline,       -- hide the tabline
  winbar        -- hide winbar
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
  "██      ██    ██  ██████  ██    ██ ██ ███    ███",
  "██      ██    ██ ██       ██    ██ ██ ████  ████",
  "██      ██    ██ ██   ███ ██    ██ ██ ██ ████ ██",
  "██      ██    ██ ██    ██  ██  ██  ██ ██  ██  ██",
  "███████  ██████   ██████    ████   ██ ██      ██",
  "","","","",
  },
    center = {
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Find File',
        desc_hl = 'String',
        key = '0',
        keymap = '',
        key_hl = 'Number',
        action = ":lua require('telescope.builtin').find_files({layout_strategy='vertical',layout_config={width=0.9}})",
      },
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Find Dotfiles',
        desc_hl = 'String',
        key = '1',
        keymap = '',
	key_hl = 'Number',
        action = ':edit /home/$USER/.config/nvim/'
      },
      {
	icon = '  ',
        icon_hl = 'Title',
	desc = "Change Dashboard settings",
        desc_hl = 'String',
	key = '2',
	keymap = '',
	key_hl = 'Number',
	action = ':edit ~/.config/nvim/lua/config/dashboard-config.lua'
      },
      {
	      icon = '  ',
              icon_hl = 'Title',
	      desc = "Modify Neovim Plugins",
	      desc_hl = 'String',
	      key = '3',
	      keymap = '',
	      key_hl = 'Number',
	      action = ':edit ~/.config/nvim/lua/config/plugins.lua'
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
	      icon = '☁  ',
              icon_hl = 'Title',
	      desc = 'Our Club Website',
	      desc_hl = 'String',
	      key = '5',
	      key_hl = 'Number',
	      action = ':exe ":silent !xdg-open lugvitc.org"',
      },
      {
	      icon = '  ',
              icon_hl = 'Title',
	      desc = 'Our Club Forum',
	      desc_hl = 'String',
	      key = '6',
	      key_hl = 'Number',
	      action = ':exe ":silent !xdg-open forum.lugvitc.org"',
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
  footer = {"","","Made with ♥  by LUGVITC"}
    },
}
