require("core")
require("lazy-nvim")
require("current-theme")

if vim.g.neovide then
	-- Put anything you want to happen only in Neovide here
	vim.g.neovide_transparency = 0.6
	vim.g.transparency = 0.8
	vim.g.neovide_window_blurred = true
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_cursor_animate_in_insert_mode = true
end
