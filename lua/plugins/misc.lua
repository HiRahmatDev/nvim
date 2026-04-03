require('mini.surround').setup()
require('mini.pairs').setup()
require('better_escape').setup({
  mappings = {
    i = {
      j = { j = false },
      k = { j = '<Esc>' }
    },
    c = {
      j = { j = false },
      k = { j = '<Esc>' }
    },
    t = {
      k = { j = '<C-\\><C-n>' }
    },
    v = {
      k = { j = '<Esc>' }
    },
    s = {
      k = { j = '<Esc>' }
    }
  }
})
