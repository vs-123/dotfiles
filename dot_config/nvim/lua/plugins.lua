-------------
-- PLUGINS --
-------------

vim.cmd([[
call plug#begin()
Plug 'folke/lazydev.nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'neovim/nvim-lspconfig'
Plug 'godlygeek/tabular'
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
      end),
      ['<enter>'] = cmp.mapping.confirm(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
   },
   window = { completion = { max_height = 7 } },
   sources = { { name = "nvim_lsp" } },
   completion = { autocomplete = false },
})
