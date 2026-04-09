require('mini.surround').setup()
require('mini.pairs').setup()
require('ibl').setup()
require('nvim-navic').setup({
  lsp = {
    auto_attach = true,
  },
})
require('breadcrumbs').setup()
require('better_escape').setup({
  mappings = {
    i = {
      j = { j = false },
      k = { j = '<Esc>' },
    },
    c = {
      j = { j = false },
      k = { j = '<Esc>' },
    },
    t = {
      k = { j = '<C-\\><C-n>' },
    },
    v = {
      j = { k = false },
    },
    s = {
      k = { j = '<Esc>' },
    },
  },
})
