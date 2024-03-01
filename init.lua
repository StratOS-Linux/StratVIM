require("core")
require("lazy-nvim")

-- Configuring coloscheme
local colorscheme = require("huez.api").get_colorscheme()
vim.cmd("colorscheme " .. colorscheme)

