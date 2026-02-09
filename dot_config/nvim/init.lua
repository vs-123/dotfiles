vim.o.cursorline = true
vim.o.nu = true
vim.o.rnu = true

vim.cmd('colo retrobox')

vim.o.expandtab = true
vim.o.shiftwidth = 3
vim.o.tabstop = 3

vim.o.completeopt = 'menuone'
vim.o.shortmess = 'I'
vim.o.swapfile = false

vim.o.mouse = ''
vim.o.scrolloff = 3
vim.o.virtualedit = "all"

vim.cmd(":set path+=**")

vim.g.mapleader = " "

vim.keymap.set('c', '<C-a>', '<HOME>', { silent = true })
vim.keymap.set('c', '<C-e>', '<END>', { silent = true })
vim.keymap.set('n', '<C-w>1', ':on<CR>', { silent = true })
vim.keymap.set('n', '<leader>e', ':Ex<CR>', { silent = true })
vim.keymap.set('n', '<leader>h', ':bp<CR>', { silent = true })
vim.keymap.set('n', '<leader>l', ':bn<CR>', { silent = true })
vim.keymap.set('n', '<leader>q', ':bd<CR>', { silent = true })
vim.keymap.set('n', '<leader>q', ':bd<CR>', { silent = true })
vim.keymap.set('n', '<leader>Q', ':bd!<CR>', { silent = true })
vim.keymap.set('n', '<leader>t', ':term<CR>', { silent = true })
vim.keymap.set('t', '<esc>', '<C-\\><C-n>', { silent = true })

vim.cmd([[
call plug#begin()
Plug 'folke/lazydev.nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'neovim/nvim-lspconfig'
call plug#end()
]])

-----------
--  LSP  --
-----------

vim.lsp.config.clangd = {
   root_markers = { '.git' },
   filetypes = { 'c' },
}

vim.lsp.enable('clangd')

vim.lsp.config.cmake = {
   cmd = { 'cmake-language-server' },
   root_markers = { 'CMakeLists.txt' },
   filetypes = { 'cmake' }
}

vim.lsp.enable('cmake')

-- FOR NVIM PLUGIN CFG
require("lazydev").setup({
   library = {
      "~/.local/share/nvim/plugged",
   },
})

vim.lsp.config.lua_ls = {
   cmd = { 'lua-language-server' },
   root_markers = { 'init.lua', '.git' },
   filetypes = { 'lua' },
   settings = {
      Lua = {
         telemetry = { enable = false },
         workspace = {
            checkThirdParty = false,
            library = {
               vim.env.VIMRUNTIME,
            },
         },
      },
   },
}

vim.lsp.enable('lua_ls')

-- DISABLE SQUIGGLY LINES AND STUFF
vim.diagnostic.config({ virtual_text = false, signs = false, underline = false })

vim.keymap.set('n', '<leader>f', function()
   vim.lsp.buf.format({ async = true })
   print("[LSP] FORMAT")
end)

vim.keymap.set('n', '<leader>r', function()
   vim.ui.input({ prompt = '[RENAME] ' }, function(inp)
      vim.lsp.buf.rename(inp)
      print("[LSP] RENAME")
   end)
end)

vim.keymap.set('n', '<leader>j', function()
   vim.lsp.buf.definition()
   print("[LSP] DEFINITION")
end)

vim.keymap.set('n', '<leader>R', function()
   vim.lsp.buf.references()
   print("[LSP] REFERENCES")
end)

-----------
--  CMP  --
-----------

local cmp = require('cmp')

-- DISABLE AUTOCOMPLETE AND USE MANUAL TRIGGER
-- AUTOCOMPLETE'S TOO DISTRACTING
cmp.setup({
   mapping = {
      ['<C-i>'] = cmp.mapping(function(_)
         cmp.complete()
         --cmp.select_next_item()
      end),
      ['<enter>'] = cmp.mapping.confirm(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
   },
   window = { completion = { max_height = 7 } },
   sources = { { name = "nvim_lsp" } },
   completion = { autocomplete = false },
})
