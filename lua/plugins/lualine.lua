return {
 'nvim-lualine/lualine.nvim',
 dependencies={{ 'nvim-lualine/lualine.nvim'}},
 config=function()
	 require('lualine').setup{
		 options={theme = 'horizon'}
	 }
end
}
