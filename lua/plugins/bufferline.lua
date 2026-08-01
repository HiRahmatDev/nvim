local bufferline = require("bufferline")

bufferline.setup({
	options = {
		mode = "buffers",
		indicator = {
			style = "none",
		},
		buffer_close_icon = " ",
		style_preset = bufferline.style_preset.no_italic,
		offsets = {
			{
				filetype = "neo-tree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
			},
		},
		separator_style = "slant",
	},
})
