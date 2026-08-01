require("lualine").setup({
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename", "filetype" },
		lualine_x = { "encoding", "fileformat" },
		lualine_y = {
			function()
				if not package.loaded["lsp-progress"] then
					return ""
				end
				return require("lsp-progress").progress()
			end,
			"progress",
		},
		lualine_z = {
			"location",
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename", "filetype" },
		lualine_x = { "encoding", "fileformat" },
		lualine_y = {
			function()
				if not package.loaded["lsp-progress"] then
					return ""
				end
				return require("lsp-progress").progress()
			end,
			"progress",
		},
		lualine_z = {
			"location",
		},
	},
	options = {
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "neo-tree" },
	},
})
require("lsp-progress").setup()
