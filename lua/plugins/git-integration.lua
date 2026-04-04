require('gitsigns').setup()

local neogit = require('neogit')
local opts = require('utils.keymap_opts')

vim.keymap.set({ 'n' }, '<leader>gg', neogit.open, opts)
vim.keymap.set({ 'n' }, '<leader>gd', ':DiffviewOpen<CR>', opts)
