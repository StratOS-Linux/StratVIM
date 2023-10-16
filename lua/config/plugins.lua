return{ 
{
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
},
 {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({ default = true })
    end,
  },
  {
    "glepnir/galaxyline.nvim",
    config=function()
	    require("galaxyline").setup()
     end
  },
}
