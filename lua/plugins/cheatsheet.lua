return{
	'slipstream8125/cheatsheet.nvim',

  dependencies = {
    {'nvim-telescope/telescope.nvim'},
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'},
  },
 keys={
	{ "<C-h>", "<cmd>:Cheatsheet<CR>", desc = "Cheatsheet" },
	{"<leader>h","<cmd>:Cheatsheet<CR>",desc = "Cheatsheet"}
   },
   config=function ()
		require("cheatsheet").setup({
			 include_only_installed_plugins = true,
			 bundled_cheatsheets = {
			},
		})
   end
}
