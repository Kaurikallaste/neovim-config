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
vim.keymap.set('n', 'gd', '<cmd> lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', '<Leader>c', ':noh<CR>')
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})

-- Packages
vim.pack.add {
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { src = 'https://github.com/NeogitOrg/neogit' },
    { src = 'https://github.com/nvim-lua/plenary.nvim' }, -- neogit dep
    { src = 'https://github.com/sindrets/diffview.nvim' }, -- neogit dep
    { src = 'https://github.com/nvim-telescope/telescope.nvim', build = 'make' },
    { src = 'https://github.com/ellisonleao/gruvbox.nvim' },
}


-- Telescope setup
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>f', builtin.find_files, { desc = 'Telescope find files'})

 -- LSP
 -- GO
vim.lsp.config('go', {
    cmd = { 'gopls' },
    filetypes = { 'go' },
    root_markers = { { 'go.mod' }, '.git' }
})
vim.lsp.enable('go')

vim.lsp.config('tsserver', {
  cmd = {'typescript-language-server', '--stdio'},
  filetypes = { 'typescript' },
  root_dir = vim.fs.root(0, {'package.json', '.git'}),
  on_attach = on_attach,
  capabilities = capabilities,
})
vim.lsp.enable('tsserver')

-- Inline diagnostic messages
vim.diagnostic.config({
    virtual_text = true,
})

-- Treesitter
require'nvim-treesitter'.setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

require'nvim-treesitter'.install { 'go', 'typescript' }

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go', 'ts', 'tsx' },
  callback = function() vim.treesitter.start() end,
})

-- Theme
vim.o.background = dark
vim.cmd([[colorscheme gruvbox]])
