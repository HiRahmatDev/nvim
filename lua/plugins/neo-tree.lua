require("neo-tree").setup({
	event_handlers = {
		{
			event = "neo_tree_buffer_enter",
			handler = function()
				vim.wo.number = true
				vim.wo.relativenumber = true
			end,
		},
	},
	window = {
		position = "float",
		mappings = {
			["<space>"] = {
				"toggle_node",
				nowait = true,
			},
		},
	},
	filesystem = {
		window = {
			mappings = {
				-- ["/"] = "noop", -- Disable fuzzy_finder.
				-- ["#"] = "noop", -- Disable fuzzy_sorter.
				-- ["f"] = "noop", -- Disable filter_on_submit.
				-- ["<"] = "noop", -- Disable prev_source (switch to git_status).
				-- [">"] = "noop", -- Disable next_source (switch to buffers).
			},
		},
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
			hide_ignored = false,
		},
	},
})

---@class open_explorer.Args
---The source to use for this action. This will default to the default_source specified in the user's config.
---@field source string|"filesystem"|"buffers"|"git_status"|"migrations"|"last"?
---The position this action will affect. This will default to the the last used position or the position specified in
---the user's config for the given source.
---@field position string|"left"|"right"|"float"|"current"?

---@param args open_explorer.Args?
local function open_explorer(args)
	args = args or {}
	local source = args.source or "filesystem"
	local position = args.position or "float"

	require("neo-tree.command").execute({
		action = "focus",
		source = source,
		position = position,
		toggle = true,
		reveal = true,
	})
end

local map = require("utils.keymap")

map({ "n" }, "\\ff", function()
	open_explorer()
end, "Focus Neo-tree float explorer")

map({ "n" }, "\\fd", function()
	open_explorer({ position = "left" })
end, "Focus Neo-tree left panel explorer")

map({ "n" }, "\\fg", function()
	open_explorer({ position = "right" })
end, "Focus Neo-tree right panel explorer")

map({ "n" }, "\\fc", function()
	open_explorer({ position = "current" })
end, "Focus Neo-tree current window explorer")
