return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
		  "hiphish/rainbow-delimiters.nvim",
		  "JoosepAlviste/nvim-ts-context-commentstring",
		  "nvim-treesitter/nvim-treesitter-textobjects",
		  "RRethy/nvim-treesitter-textsubjects",
    },
		config = function ()
			--	local treesitter = require("nvim-treesitter.configs") -- (has been deprecated)
			local treesitter = require('ts_context_commentstring')

			treesitter.setup({
				highlight = {
					enable = true
				},
				indent = {
					enable = true
				},
				autotag = {
					enable = true
				},
				ensure_installed = {
					"c",
					"cpp",
					"astro",
					"json",
					"javascript",
					"typescript",
					"tsx",
					"yaml",
					"html",
					"css",
					"prisma",
					"markdown",
					"markdown_inline",
					"svelte",
					"graphql",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
					"query",
					"java",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>"
					}
				},
				context_commentstring = {
					enable = true,
					enable_autocmd = false
				}
			})
		end
	}
}
