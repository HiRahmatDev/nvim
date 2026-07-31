require("catppuccin").setup({
	color_overrides = {
		mocha = {
			rosewater = "#f5e0dc",
			flamingo = "#fc9867", -- Changed.
			pink = "#f5c2e7",
			mauve = "#cba6f7",
			red = "#ff6188", -- Changed.
			maroon = "#eba0ac",
			peach = "#fab387",
			yellow = "#ffd866", -- Changed.
			green = "#a9dc76",
			teal = "#94e2d5",
			sky = "#89dceb",
			sapphire = "#74c7ec",
			blue = "#6d8fc6", -- Changed.
			lavender = "#b4befe",
			text = "#cdd6f4",
			subtext1 = "#bac2de",
			subtext0 = "#a6adc8",
			overlay2 = "#9399b2",
			overlay1 = "#7f849c",
			overlay0 = "#6c7086",
			surface2 = "#585b70",
			surface1 = "#45475a",
			surface0 = "#313244",
			base = "#10131C", -- Changed.
			mantle = "#10121C", -- Changed.
			crust = "#0D0F17", -- Changed.
		},
	},
	highlight_overrides = {
		mocha = function(mocha)
			return {
				Boolean = { fg = mocha.mauve, style = { "italic" } },
				Comment = { fg = mocha.surface2 },
				Conditional = { fg = mocha.red },
				Exception = { fg = mocha.red },
				Function = { fg = mocha.yellow },
				Include = { fg = mocha.red },
				Keyword = { fg = mocha.teal, style = { "italic" } },
				Number = { fg = mocha.teal },
				Operator = { fg = mocha.red },
				Special = { fg = mocha.flamingo },
				Type = { fg = mocha.teal },
				["@keyword.export"] = { fg = mocha.red },
				["@keyword.function"] = { fg = mocha.teal, style = { "italic" } },
				["@keyword.operator"] = { fg = mocha.red },
				["@keyword.return"] = { fg = mocha.red },
				["@lsp.type.variable"] = { fg = mocha.text },
				["@lsp.typemod.variable.readonly.typescriptreact"] = { fg = mocha.mauve },
				["@module"] = { fg = mocha.text },
				["@tag"] = { fg = mocha.teal },
				["@tag.builtin"] = { fg = mocha.red },
				["@type.builtin"] = { fg = mocha.teal },
				["@variable.parameter"] = { fg = mocha.flamingo, style = { "italic" } },
			}
		end,
	},
	float = {
		solid = false,
		transparent = false,
	},
	transparent_background = false,
})

vim.cmd.colorscheme("catppuccin-mocha")
