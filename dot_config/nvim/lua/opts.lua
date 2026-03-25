vim.o.completeopt = 'menuone'
vim.o.cursorline = true
vim.o.expandtab = false
vim.o.mouse = 'a'
vim.o.nu = true
vim.o.rnu = true
vim.o.scrolloff = 3
vim.o.shiftwidth = 3
vim.o.shortmess = 'I'
vim.o.swapfile = false
vim.o.tabstop = 3
vim.o.virtualedit = "all"

vim.cmd('colo royal-hemlock')
vim.cmd('filetype plugin off')
vim.cmd("let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'")
vim.cmd(":set path+=**")
vim.cmd(":set list")
vim.opt.listchars = {
	leadmultispace = '│ ',
	trail = '·',
	tab = '  '
}

local rnu_toggle = vim.api.nvim_create_augroup("You're watching me... aren't you?", { clear = true })

vim.api.nvim_create_autocmd("CmdlineEnter", {
	group = rnu_toggle,
	callback = function()
		if vim.v.event.cmdtype == ":" then
			vim.o.rnu = false
			vim.cmd("redraw")
		end
	end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
	group = rnu_toggle,
	callback = function()
		if vim.v.event.cmdtype == ":" then
			vim.o.rnu = true
		end
	end,
})

vim.cmd("command! -nargs=+ -complete=file Vg vimgrep <args> | copen")
