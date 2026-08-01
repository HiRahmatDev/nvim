require("telescope").setup({
	defaults = {
		mappings = {
			n = {
				["q"] = "close",
			},
		},
		file_ignore_patterns = {
			"node_modules",
			".git",
			".next",
			".agents",
			".agent",
			".claude",
			"coverage",
		},
	},
	pickers = {
		find_files = {
			hidden = true,
			no_ignore = true,
			no_ignore_parent = true,
		},
		live_grep = {
			additional_args = {
				"--hidden",
			},
		},
		buffers = {
			sort_mru = true, -- Sort all buffers after most recent used.
			path_display = { "tail" },
			file_ignore_patterns = {}, -- Override default, don't hide any files.
		},
	},
})

local map = require("utils.keymap")

map({ "n" }, "<leader>ff", ":Telescope fd<CR>", "Telescope find files")
map({ "n" }, "<leader>fg", ":Telescope live_grep<CR>", "Telescope live grep")
map({ "n" }, "<leader>fb", ":Telescope buffers<CR>", "Telescope buffers")
