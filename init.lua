vim.o.number = true
vim.o.complete = '.,o'
vim.o.completeopt = 'fuzzy,menuone,noselect'
vim.o.autocomplete = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.swapfile = false

vim.g.mapleader = ' '

vim.keymap.set('n', '<Leader>e', ':Explore<CR>')
vim.keymap.set('n', '<Leader>o', ':so<CR>')
vim.keymap.set('n', '<Leader>s', ':w<CR>')
vim.keymap.set('n', '<Leader>g', ':Neogit<CR>')
vim.keymap.set('n', '<Leader>qq', ':q<CR>')

-- Packages
vim.pack.add {
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { src = 'https://github.com/NeogitOrg/neogit' },
    { src = 'https://github.com/nvim-lua/plenary.nvim' }, -- neogit dep
    { src = 'https://github.com/sindrets/diffview.nvim' }, -- neogit dep
    { src = 'https://github.com/nvim-mini/mini.pick' }, -- neogit dep
    { src = 'https://github.com/ellisonleao/gruvbox.nvim' },
}

 -- LSP
 -- GO
vim.lsp.config('go', {
    cmd = { 'gopls' },
    filetypes = { 'go' },
    root_markers = { { 'go.mod' }, '.git' }
})
vim.lsp.enable('go')

-- Inline diagnostic messages
vim.diagnostic.config({
    virtual_text = true,
})

-- Treesitter
require'nvim-treesitter'.setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

require'nvim-treesitter'.install { 'go' }

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go' },
  callback = function() vim.treesitter.start() end,
})

-- Theme
vim.o.background = dark
vim.cmd([[colorscheme gruvbox]])
