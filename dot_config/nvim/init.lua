vim.o.nu = true
vim.o.rnu = true

vim.o.smartindent = true
vim.o.expandtab = true
vim.o.tabstop = 3
vim.o.shiftwidth = 3

vim.o.shortmess = 'I'

vim.o.mouse = 'a'
vim.o.scrolloff = 3

vim.o.virtualedit = "all"
vim.o.swapfile = false

vim.cmd('colo retrobox')

vim.o.cursorline = true
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>l', ':tabn<CR>')
vim.keymap.set('n', '<leader>h', ':tabp<CR>')
vim.keymap.set('n', '<leader>.', ':tabn<CR>')
vim.keymap.set('n', '<leader>,', ':tabp<CR>')
vim.keymap.set('n', '<leader>n', ':tabnew<CR>')
vim.keymap.set('n', '<leader>q', ':tabclose<CR>')
vim.keymap.set('n', '<leader>Q', ':bd!<CR>')

vim.keymap.set('n', '<leader>e', ':Ex<CR>')

vim.keymap.set('n', '<C-w>1', ':on<CR>')

vim.keymap.set('n', '<leader>t', ':term<CR>')

vim.keymap.set('i', '<C-f>', '<Right>')
vim.keymap.set('i', '<C-b>', '<Left>')

vim.keymap.set('t', '<esc>', '<C-\\><C-n>')

vim.keymap.set('c', '<C-a>', '<HOME>')
vim.keymap.set('c', '<C-e>', '<END>')
vim.keymap.set('c', '<C-f>', '<Right>')
vim.keymap.set('c', '<C-b>', '<Left>')

vim.cmd([[
call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'jremmen/vim-ripgrep'
call plug#end()
]])

vim.lsp.config.clangd = {
   root_markers={'.git'},
   filetypes={'c'},
}

vim.lsp.enable('clangd')

vim.lsp.config.cmake = {
   cmd = {'cmake-language-server'},
   root_markers={'CMakeLists.txt'},
   filetypes={'cmake'}
}

vim.lsp.enable('cmake')

vim.diagnostic.config({virtual_text=false, signs=false, underline=false})

vim.keymap.set('n', '<leader>f', function()
   vim.lsp.buf.format({ async=true })
   print("[SUCCESS] Formatted!")
end)

vim.keymap.set('n', '<leader>r', function()
   vim.lsp.buf.rename()
   print("[SUCCESS] Renamed!")
end)

local cmp = require('cmp')

cmp.setup({
	mapping = {
		['<C-i>'] = cmp.mapping.complete(),
		['<C-A-i>'] = cmp.mapping.complete(),
		['<C-A-j>'] = cmp.mapping.open_docs(),
      ['<enter>'] = cmp.mapping.confirm(),
      ['<C-enter>'] = cmp.mapping.confirm(),
      ['<TAB>'] = cmp.mapping.confirm(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<Down>'] = cmp.mapping.select_next_item(),
		['<Up>'] = cmp.mapping.select_prev_item(),
	},
	window={completion={max_height = 7}},
	sources={{name="nvim_lsp"}, {name="buffer"}},
	completion = { autocomplete = false, keyword_length = 2 },
})

vim.o.completeopt = 'menuone'
