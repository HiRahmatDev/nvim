require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    json = { 'prettier' },
    html = { 'prettier' },
    css = { 'prettier' },
    javascript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescript = { 'prettier' },
    typescriptreact = { 'prettier' },
  },
})

local opts = require('utils.keymap_opts')
vim.keymap.set({ 'n' }, '<leader>F', require('conform').format, opts)
vim.keymap.set({ 'n' }, 'F<leader>', require('conform').format, opts)
