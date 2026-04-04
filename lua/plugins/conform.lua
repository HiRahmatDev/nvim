require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    json = { 'prettier' },
    html = { 'prettier' },
    css = { 'prettier' },
    javascript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescript = { 'prettier' },
    typescriptreact = { 'prettier' },
  },
  formatters = {
    prettier = {
      command = 'node',
      args = function(_, ctx)
        local local_prettier = vim.fn.getcwd() .. '/node_modules/prettier/bin/prettier.cjs'
        local mason_prettier = vim.fn.stdpath('data')
          .. '/mason/packages/prettier/node_modules/prettier/bin/prettier.cjs'

        local prettier_path
        if vim.fn.filereadable(local_prettier) == 1 then
          prettier_path = local_prettier
        else
          prettier_path = mason_prettier
        end

        return {
          prettier_path,
          '--stdin-filepath',
          ctx.filename,
        }
      end,
    },
  },
})

local opts = require('utils.keymap_opts')
vim.keymap.set({ 'n' }, ';f', require('conform').format, opts)
