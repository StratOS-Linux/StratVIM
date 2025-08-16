return{
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("cyberdream").setup({
            transparent = true, -- enable transparent background
            italic_comments = true, -- italicize comments
            hide_fillchars = true, -- replace all fillchars with ' ' for the ultimate clean look
        })
		require("notify").setup({
  background_colour = "#000000",
})

    end,
}
