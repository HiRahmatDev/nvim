require('core.disable-provider')
require('core.options')
require('core.autocommands')
require('core.user-commands')
require('core.keymaps')

-- PLUGINS
--
-- See `:h :packadd`, `:h vim.pack`

-- Add the "nohlsearch" package to automatically disable search highlighting after
-- 'updatetime' and when going to insert mode.
vim.cmd('packadd! nohlsearch')

-- Install third-party plugins via "vim.pack.add()".
vim.pack.add({
  -- Quickstart configs for LSP
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',

  -- Autocompletion
  'https://github.com/nvim-mini/mini.completion',

  -- Enhanced quickfix/loclist
  'https://github.com/stevearc/quicker.nvim',

  -- Git integration
  'https://github.com/lewis6991/gitsigns.nvim',

  -- File finder
  {
    src = 'https://github.com/nvim-telescope/telescope.nvim',
    version = vim.version.range('0.2'),
  },

  -- File manager
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3'),
  },
  -- dependencies
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  -- optional, but recommended
  'https://github.com/nvim-tree/nvim-web-devicons',

  -- Color scheme
  {
    src = 'https://github.com/catppuccin/nvim',
    name = 'catppuccin',
  },

  -- Formatter
  'https://github.com/stevearc/conform.nvim',

  -- Nvim Eslint
  'https://github.com/esmuellert/nvim-eslint',

  -- Misc
  'https://github.com/dstein64/vim-startuptime',
  'https://github.com/max397574/better-escape.nvim',
  'https://github.com/nvim-mini/mini.surround',
  'https://github.com/nvim-mini/mini.pairs',
})

-- SETUP PLUGINS
--
require('plugins.neo-tree')
require('plugins.telescope')
require('plugins.colorscheme')
require('plugins.completion')
require('plugins.conform')
require('plugins.mason')
require('plugins.quicker')
require('plugins.gitsigns')
require('plugins.nvim-eslint')
require('plugins.misc')

vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
