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
						name='cyberdream',
						colorscheme='cyberdream'
					}},
				themeConfigFile = "~/.config/nvim/init.lua",
				livePreview=true,
				
			})
		end
}
