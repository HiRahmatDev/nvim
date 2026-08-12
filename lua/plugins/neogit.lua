local neogit = require("neogit")

neogit.setup({
	graph_style = "kitty",
	commit_editor = {
		kind = "tab",
		staged_diff_split_kind = "auto",
	},
})

local map = require("utils.keymap")

local function neogit_open(args)
	return function()
		require("neogit").open(args)
	end
end

map("n", "<leader>gg", neogit_open({ kind = "floating" }), "Open Neogit status")
map("n", "<leader>gl", neogit_open({ "log" }), "Open Neogit log")
map("n", "<leader>gc", neogit_open({ "commit" }), "Open Neogit commit")
map("n", "<leader>gm", neogit_open({ "merge" }), "Open Neogit merge")
map("n", "<leader>gP", neogit_open({ "push" }), "Neogit push")
map("n", "<leader>gp", neogit_open({ "pull" }), "Neogit pull")
