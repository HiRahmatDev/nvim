local bufferline = require("bufferline")

bufferline.setup({
	options = {
		mode = "buffers",
		indicator = {
			style = "none",
		},
		buffer_close_icon = " ",
		style_preset = bufferline.style_preset.no_italic,
	},
})
