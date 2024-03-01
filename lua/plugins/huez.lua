
-- Lazy
return{
    "vague2k/huez.nvim",
    dependencies = {
        -- You probably already have this installed.
        -- reccomended, but optional dependency.
        -- Will use vim.ui as a default unless specified otherwise, or a fallback.
        -- Preview does not currently work in vim.ui.
        -- If using vim.ui, it's also reccomended to use dressing.nvim.
        "nvim-telescope/telescope.nvim",
    },
	config = function ()
		require("huez").setup({
		picker = "telescope",
		vim.keymap.set("n", "<leader>co", "<cmd>Huez<CR>", {})
	})
	end
}
