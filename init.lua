vim.g.mapleader = " "
vim.g.maplocalleader = " "
require "config.lazy"
-- require "config.options"
vim.cmd.colorscheme('tokyonight')
 require('lualine').setup()
 require ("config.dashboard-config")
