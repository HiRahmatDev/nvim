require("nvim-treesitter").install({
	"json",
	"html",
	"css",
	"javascript",
	"typescript",
	"jsx",
	"tsx",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"json",
		"html",
		"css",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
	},
	callback = function()
		vim.treesitter.start()
	end,
})
