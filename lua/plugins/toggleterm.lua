return {
	'akinsho/toggleterm.nvim',
 config = function()
		require("toggleterm").setup{
			direction = 'float',
			border = 'single'
		}
	end,
	cmd = {
      "ToggleTerm",
      "TermExec",
      "ToggleTermToggleAll",
      "ToggleTermSendCurrentLine",
      "ToggleTermSendVisualLines",
      "ToggleTermSendVisualSelection",
    },	 keys = {
      { "<C-t>", "<cmd>lua require('toggleterm').toggle()<CR>", desc = "Toggle Terminal Window" },
    },
}
