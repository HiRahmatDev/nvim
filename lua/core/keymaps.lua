-- Set <space> as the leader key
-- See `:h mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- KEYMAPS
--
-- See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

local opts = require('utils.keymap_opts')

-- Quick edit neovim configurations
vim.keymap.set({ 'n' }, '<leader>ev', ':e $MYVIMRC<CR>', opts)

-- Quick save
vim.keymap.set({ 'n' }, ';w', ':w<CR>', opts)

-- Quick close
vim.keymap.set({ 'n' }, ';c', ':close<CR>', opts)

-- Quick quit
vim.keymap.set({ 'n' }, ';q', ':q<CR>', opts)

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', opts)

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h', opts)
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j', opts)
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k', opts)
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l', opts)
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h', opts)
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j', opts)
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k', opts)
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l', opts)

-- Diagnostic LSP
vim.keymap.set({ 'n' }, '<leader>dn', function()
  vim.diagnostic.jump({ count = 1, float = true })
end, opts)

vim.keymap.set({ 'n' }, '<leader>dp', function()
  vim.diagnostic.jump({ count = -1, float = true })
end, opts)

-- Git
vim.keymap.set({ 'n' }, '<leader>gb', ':GitBlameLine<CR>', opts)
