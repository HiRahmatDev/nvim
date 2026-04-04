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
  -- LSP
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',

  -- Color scheme
  {
    src = 'https://github.com/catppuccin/nvim',
    name = 'catppuccin',
  },

  -- Completion
  'https://github.com/nvim-mini/mini.completion',

  -- Enhanced quickfix/loclist
  'https://github.com/stevearc/quicker.nvim',

  -- File finder
  {
    src = 'https://github.com/nvim-telescope/telescope.nvim',
    version = vim.version.range('0.2'),
  },
  -- required dependencies
  -- 'https://github.com/nvim-lua/plenary.nvim',

  -- File manager
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3'),
  },
  -- required dependencies
  -- 'https://github.com/nvim-lua/plenary.nvim',
  -- 'https://github.com/MunifTanjim/nui.nvim',
  -- optional dependencies
  -- 'https://github.com/nvim-tree/nvim-web-devicons',

  -- Git integration
  --
  --    Gitsigns
  'https://github.com/lewis6991/gitsigns.nvim',
  --
  --    Neogit
  'https://github.com/neogitorg/neogit',
  --    required dependencies
  --    'https://github.com/nvim-lua/plenary.nvim',
  --    optional dependencies
  --    'https://github.com/nvim-telescope/telescope.nvim',
  --    'https://github.com/sindrets/diffview.nvim',
  --
  --    Diffview
  'https://github.com/sindrets/diffview.nvim',

  -- Formatter
  'https://github.com/stevearc/conform.nvim',

  -- Nvim Eslint
  'https://github.com/esmuellert/nvim-eslint',

  -- Misc
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
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
require('plugins.git-integration')
require('plugins.nvim-eslint')
require('plugins.misc')

vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
