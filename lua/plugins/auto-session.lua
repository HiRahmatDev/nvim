require("auto-session").setup({
	auto_save = true,
	-- close_filetypes_on_save = { "checkhealth", "neo-tree" },
	session_lens = {
		mappings = {
			delete_session = { { "i", "n" }, "<A-d>" },
			alternate_session = { { "i", "n" }, "<A-s>" },
		},
	},
})

local map = require("utils.keymap")

map({ "n" }, "<leader>fs", ":AutoSession search<CR><Esc>", "Search sessions")
map({ "n" }, "<leader>ss", ":AutoSession toggle<CR>", "Toggle auto save session")
map({ "n" }, "<leader>sc", ":AutoSession save<CR>", "Save current session")
map({ "n" }, "<leader>sd", ":AutoSession delete<CR>", "Delete current session")
