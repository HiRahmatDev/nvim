-- OPTIONS
--
-- See `:h vim.o`
-- NOTE: You can change these options as you wish!
-- For more options, you can see `:h option-list`
-- To see documentation for an option, you can use `:h 'optionname'`, for example `:h 'number'`
-- (Note the single quotes)

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
vim.o.wrap = false -- Default to false, you can toggle it by ';z'. See 'core.keymaps:31'.
vim.o.linebreak = true -- Wrap whole word.
vim.o.updatetime = 300
