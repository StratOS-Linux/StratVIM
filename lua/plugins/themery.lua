return 
{
		'zaldih/themery.nvim',
		config=function ()
			require('themery').setup({
				themes={{
					name='oxocarbon',
					colorscheme='oxocarbon'
				},
				{
					name='gruvbox',
					colorscheme='gruvbox'
				},
				{
					name='tokyonight',
					colorscheme='tokyonight',
				},
				{
					name='cyberdream',
					colorscheme='cyberdream'
				},
				{
					name='nightfox',
					colorscheme='nightfox',
				},
				{
					name='duskfox',
					colorscheme='duskfox',
				}
			},
				themeConfigFile = "~/.config/nvim/init.lua",
				livePreview=true,
				
			})
		end
}
