require("lualine").setup({
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(res)
					local mode_map = {
						["NORMAL"] = "N",
						["O-PENDING"] = "N?",
						["INSERT"] = "I",
						["VISUAL"] = "V",
						["V-BLOCK"] = "VB",
						["V-LINE"] = "VL",
						["V-REPLACE"] = "VR",
						["REPLACE"] = "R",
						["COMMAND"] = "!",
						["SHELL"] = "SH",
						["TERMINAL"] = "T",
						["EX"] = "X",
						["S-BLOCK"] = "SB",
						["S-LINE"] = "SL",
						["SELECT"] = "S",
						["CONFIRM"] = "Y?",
						["MORE"] = "M",
					}
					return mode_map[res] or res
				end,
				separator = { left = "", right = "" },
			},
		},
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename", "filetype" },
		lualine_x = { "encoding", "fileformat" },
		lualine_y = {
			function()
				return require("lsp-progress").progress()
			end,
			"progress",
		},
		lualine_z = {
			{ "location", separator = { left = "", right = "" } },
		},
	},
	options = {
		-- component_separators = { left = "", right = "" },
		component_separators = { left = "︱", right = "︱" },
		section_separators = { left = "", right = "" },
		globalstatus = true,
	},
})
require("lsp-progress").setup()
