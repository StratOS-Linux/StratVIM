return{
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
--	keys = {
--				{'<leader-w>','<cmd>:BufferLineCycleNext<CR>',desc = 'Cycle Buffers'},
--			},
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup{}
		  local keymap = vim.keymap -- for conciseness
		  keymap.set("n","<C-w>","<cmd>:BufferLineCycleNext<cr>",{desc="Cycle Buffers"})
	end
}
