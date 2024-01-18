return{
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
	cmds={'lazygit'},
	keys={
		 { "<C-l>", "<cmd>:LazyGit<CR>", desc = "NvimTree" },
	}
    }
