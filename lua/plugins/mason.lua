local NODE_VERSION = "24.18.0"

local home = os.getenv("HOME")
local node_bin = home .. "/.volta/tools/image/node/" .. NODE_VERSION .. "/bin"
local volta_bin = home .. "/.volta/bin"

-- Hapus direktori shim Volta dari PATH biar tidak ke-intercept oleh shim `node`/`npm` versi project
local new_path = vim.env.PATH:gsub(volta_bin .. ":?", "")

-- Prepend Node versi spesifik ke PATH
-- Ini mengatasi error saat root_dir project punya Volta pin Node versi lama (< v18)
vim.env.PATH = node_bin .. ":" .. new_path

local ensure_installed = {
	"stylua",
	"eslint",
	"lua_ls",
	"tailwindcss",
	"tsgo", -- LSP for javascript like ts_ls, but faster with go.
	"html",
	"cssls",
}

require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = ensure_installed,
	automatic_enable = false,
})

-- For better debugging, change below to (vim.log.levels.TRACE | vim.log.levels.DEBUG)
vim.lsp.log.set_level(vim.log.levels.OFF)
