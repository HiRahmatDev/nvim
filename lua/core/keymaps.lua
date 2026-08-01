local map = require("utils.keymap")

-- Quick edit neovim configurations
map({ "n" }, "<leader>ev", ":e $MYVIMRC<CR>", "Edit Neovim configuration")

-- Quick save
map({ "n" }, ";w", ":w<CR>", "Save current file")
map({ "n" }, ";W", ":wa<CR>", "Save all files")

-- Quick close
map({ "n" }, ";c", ":close<CR>", "Close current window")
map({ "n" }, ";x", ":bd<CR>", "Close current buffer")
map({ "n" }, ";tc", ":tabclose<CR>", "Close current tab")

-- Quick quit
map({ "n" }, ";q", ":q<CR>", "Quit current window")
map({ "n" }, ";Q", ":qa<CR>", "Quit all windows")

-- Quick restart
map({ "n" }, ";r", ":wa<CR>:restart<CR>", "Restart Neovim")

-- Quick refresh current buffer
map({ "n" }, ";e", ":e<CR>", "Reload current file")

-- Quick sort multiple lines
map("v", ";s", ":sort<CR>", "Sort selected lines")

-- Toggle wrap
map({ "n" }, ";z", ":setlocal invwrap<CR>", "Toggle line wrap")

-- Disable the spacebar key's default behavior in Normal and Visual modes
map({ "n", "v" }, "<Space>", "<Nop>", "Disable spacebar default behavior")

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
map({ "t", "i" }, "<A-h>", "<C-\\><C-n><C-w>h", "Go to left window (insert/terminal)")
map({ "t", "i" }, "<A-j>", "<C-\\><C-n><C-w>j", "Go to lower window (insert/terminal)")
map({ "t", "i" }, "<A-k>", "<C-\\><C-n><C-w>k", "Go to upper window (insert/terminal)")
map({ "t", "i" }, "<A-l>", "<C-\\><C-n><C-w>l", "Go to right window (insert/terminal)")
map({ "n" }, "<A-h>", "<C-w>h", "Go to left window")
map({ "n" }, "<A-j>", "<C-w>j", "Go to lower window")
map({ "n" }, "<A-k>", "<C-w>k", "Go to upper window")
map({ "n" }, "<A-l>", "<C-w>l", "Go to right window")

map({ "n" }, "<A-.>", "<C-w>>", "Increase window width")
map({ "n" }, "<A-,>", "<C-w><", "Decrease window width")
map({ "n" }, "<A-=>", "<C-w>+", "Increase window height")
map({ "n" }, "<A-->", "<C-w>-", "Decrease window height")

-- Navigate between tabs
map({ "n" }, "<A->>", "gt", "Go to next tab")
map({ "n" }, "<A-<>", "gT", "Go to previous tab")

-- Diagnostic LSP
map({ "n" }, "<leader>dn", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, "Go to next diagnostic")

map({ "n" }, "<leader>dp", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, "Go to previous diagnostic")

-- Inspect treesitter, semantic tokens, and highlight
map("n", "zS", vim.show_pos, "Show syntax/treesitter position info")
