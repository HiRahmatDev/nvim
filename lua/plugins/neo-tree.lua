local opts = require('utils.keymap_opts')

vim.keymap.set({ 'n' }, '\\f', function()
  require('neo-tree.command').execute({
    action = 'focus',
    source = 'filesystem',
    position = 'float',
    toggle = true,
    reveal = true,
  })
end, opts)

vim.keymap.set({ 'n' }, '\\b', function()
  require('neo-tree.command').execute({
    action = 'focus',
    source = 'buffers',
    position = 'float',
    toggle = true,
    reveal = true,
  })
end, opts)

vim.keymap.set({ 'n' }, '\\g', function()
  require('neo-tree.command').execute({
    action = 'focus',
    source = 'git_status',
    position = 'float',
    toggle = true,
    reveal = true,
  })
end, opts)
