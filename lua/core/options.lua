-- OPTIONS
local indentsize = 4

-- Basic options
vim.o.number = true -- Show line numbers in a column.
vim.o.relativenumber = true -- Show line numbers relative to where the cursor is.
vim.o.tabstop = indentsize
vim.o.softtabstop = indentsize
vim.o.shiftwidth = indentsize
vim.o.expandtab = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cursorline = true -- Highlight the line where the cursor is on.
vim.o.scrolloff = 8 -- Keep this many screen lines above/below the cursor.
vim.o.wrap = false -- Default to false, you can toggle it by ';z'. See 'core.keymaps:38' (with 'gF').
vim.o.linebreak = true -- Wrap whole word.
vim.o.updatetime = 400 -- Increase delay time for CursorHold and other events.
vim.o.splitbelow = true -- Put default position of horizontal split window to bottom.
vim.o.splitright = true -- Put default position of vertical split window to right.
vim.o.swapfile = false -- Disable swap file.
vim.o.cmdheight = 0
vim.o.fillchars = "eob: " -- Remove ~ end of buffer indicator.
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.o.autoread = true
vim.o.winborder = "rounded"

-- Set <space> as the leader key
-- See `:h mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.clipboard = {
	name = "wl-clipboard",
	copy = {
		["+"] = "wl-copy",
		["*"] = "wl-copy", -- fallback ke clipboard biasa, bukan --primary
	},
	paste = {
		["+"] = "wl-paste --no-newline",
		["*"] = "wl-paste --no-newline", -- fallback juga
	},
	cache_enabled = 0,
}

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.hl.on_yank()
	end,
})
