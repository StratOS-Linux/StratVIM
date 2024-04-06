return {
        "nvim-neorg/neorg",
        dependencies = { {"luarocks.nvim"},{"nvim-neorg/neorg-telescope"} },
        -- put any other flags you wanted to pass to lazy here!
		lazy = false,
		version = "*",
		config=true,
		build = ":Neorg sync-parsers",
        opts = {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/notes",
                        },
                        default_workspace = "notes",
                    },
                },
		    }
}
}
