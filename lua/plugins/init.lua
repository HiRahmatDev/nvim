vim.cmd("packadd! nohlsearch")

vim.pack.add({
	-- Treesitter
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" },

	-- File explorer
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = vim.version.range("3") },
	-- required dependencies
	-- 'https://github.com/nvim-lua/plenary.nvim',
	-- 'https://github.com/MunifTanjim/nui.nvim',

	-- File finder
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	-- required dependencies
	-- 'https://github.com/nvim-lua/plenary.nvim',

	-- Theme
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },

	-- Version control
	{ src = "https://github.com/neogitorg/neogit" },
	-- optional deps
	{ src = "https://github.com/sindrets/diffview.nvim" }, -- no setup required
	{ src = "https://github.com/lewis6991/gitsigns.nvim" }, -- no setup required

	-- Mason and LSP
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" }, -- no setup required
	{ src = "https://github.com/neovim/nvim-lspconfig" }, -- no setup required

	-- Formatter
	{ src = "https://github.com/stevearc/conform.nvim" },

	-- Auto session
	{ src = "https://github.com/rmagatti/auto-session.git" },

	-- Bufferline
	{ src = "https://github.com/akinsho/bufferline.nvim" },

	-- Lualine
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/linrongbin16/lsp-progress.nvim" },

	-- Indent Blankline
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim", name = "ibl" },

	-- Enhanced quickfix/loclist
	{ src = "https://github.com/stevearc/quicker.nvim" },

	-- Miscs and required dependencies
	{ src = "https://github.com/nvim-lua/plenary.nvim" }, -- no setup required
	{ src = "https://github.com/MunifTanjim/nui.nvim" }, -- no setup required
	{ src = "https://github.com/dstein64/vim-startuptime" }, -- no setup required
	{ src = "https://github.com/m00qek/baleia.nvim" }, -- no setup required
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- no setup required
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-mini/mini.surround" },
})

require("plugins.nvim-treesitter")
require("nvim-ts-autotag").setup()
require("plugins.oil")
require("plugins.neo-tree")
require("plugins.telescope")
require("plugins.neogit")
require("plugins.mason")
require("plugins.conform")
require("plugins.colorscheme")
require("plugins.auto-session")
require("plugins.bufferline")
require("plugins.lualine")
require("ibl").setup()
require("quicker").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
