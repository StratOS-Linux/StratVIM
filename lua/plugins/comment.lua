return{
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
		-- TODO add some options
    },
    lazy = false,
	config = function()
		require('Comment').setup()
	end
}
