return{ 
	"mistricky/codesnap.nvim", 
	build = "make build_generator", 
	version = "^1",
	config =function ()
		require("codesnap").setup({
			save_path = "~/Pictures/codesnap.png",
			bg_color = "#535c68",
			watermark = ""
		})
	end
}
