return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
	config = function()
		require("mason-null-ls").setup({
			ensure_installed = {
				"stylua",
				"jq",
				"shellharden",
				"black",
				"google-java-format",
				"prettierd",
				"rustfmt",
				"gopls",
			},
		})
	end,
}
