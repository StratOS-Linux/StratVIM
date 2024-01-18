return{
	'sudormrfbin/cheatsheet.nvim',

  dependencies = {
    {'nvim-telescope/telescope.nvim'},
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'},
  },
  keys={
	{ "<C-h>", "<cmd>:Cheatsheet<CR>", desc = "NvimTree" },
   }
}
