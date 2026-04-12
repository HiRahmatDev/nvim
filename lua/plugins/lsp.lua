require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'ts_ls',
    'tailwindcss',
    'powershell_es',
  },
})

vim.lsp.log.set_level(vim.log.levels.OFF)

vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('powershell_es')
