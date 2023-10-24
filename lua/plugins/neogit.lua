return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "nvim-telescope/telescope.nvim", -- optional
--    "sindrets/diffview.nvim",        -- optional
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
}
