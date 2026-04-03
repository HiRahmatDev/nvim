require('telescope').setup({
  path_display = 'absolute',
})

local opts = require('utils.keymap_opts')

vim.keymap.set({ 'n' }, '<leader>ff', ':Telescope find_files<CR>', opts)
vim.keymap.set({ 'n' }, '<leader>fb', ':Telescope buffers<CR>', opts)
vim.keymap.set({ 'n' }, '<leader>fl', ':Telescope live_grep<CR>', opts)
