local conform = require("conform")

conform.setup({
	default_format_opts = {
		timeout_ms = 2000,
	},
	formatters_by_ft = {
		lua = { "stylua" },
		json = { "prettier" },
		jsonc = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		less = { "prettier" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		vue = { "prettier" },
		svelte = { "prettier" },
		astro = { "prettier" },
		graphql = { "prettier" },
		markdown = { "prettier" },
		mdx = { "prettier" },
		yaml = { "prettier" },
		svg = { "prettier_svg" },
	},
	formatters = {
		prettier_svg = {
			command = "prettier",
			args = function(_, ctx)
				return {
					"--parser",
					"html",
					"--stdin-filepath",
					ctx.filename,
				}
			end,
		},
	},
})

local map = require("utils.keymap")
map({ "n" }, ";f", conform.format, "Format current buffer")
