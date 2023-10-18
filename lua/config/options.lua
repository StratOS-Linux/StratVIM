local options={
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 2,
	ignorecase = true,
	mouse = "a",
	splitbelow = true,
	splitright = true
}
vim.opt.shortmess:append "c"
for key,val in pairs(options) do 
	vim.opt[k]=v
end


vim.cmd "set whichwrap+=<,>,[,],h,l"
-- vim.cmd [[set iskeyword+=-]]
