local neogit = require("neogit")

neogit.setup({
	graph_style = "kitty",
	commit_editor = {
		kind = "tab",
		staged_diff_split_kind = "auto",
	},
})

local map = require("utils.keymap")
map("n", "<leader>gg", function()
	neogit.open({ kind = "floating" })
end, "Open Neogit status")
