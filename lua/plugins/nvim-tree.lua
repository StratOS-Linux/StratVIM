return {
    "nvim-tree/nvim-tree.lua",
    cmd = {
      "NvimTreeOpen",
     "NvimTreeClose",
      "NvimTreeToggle",
      "NvimTreeFindFile",
      "NvimTreeFindFileToggle",
    },
    keys = {
      { "<C-e>", "<cmd>lua require('nvim-tree.api').tree.toggle()<CR>", desc = "NvimTree" },
    },
    config = function()
	    require("nvim-tree").setup()
	end,
}
