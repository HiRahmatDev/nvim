local action_state = require('telescope.actions.state')
local log = require('telescope.log')
local utils = require('telescope.utils')

local open_with_slash = function(command)
  local entry = action_state.get_selected_entry()

  if not entry then
    utils.notify('actions.set.edit', {
      msg = 'Nothing currently selected',
      level = 'WARN',
    })
    return
  end

  local sections = vim.split(entry.value, ':')
  local filename = entry.path or entry.filename or sections[1]
  local row = entry.row or entry.lnum
  local col = entry.col
  local entry_path = vim.fs.normalize(filename)

  pcall(vim.cmd, string.format('%s %s', command, vim.fn.fnameescape(entry_path)))

  if vim.wo[0][0].foldmethod == 'expr' then
    vim.schedule(function()
      vim.wo[0][0].foldmethod = 'expr'
    end)
  end

  local pos = vim.api.nvim_win_get_cursor(0)
  if col == nil then
    if row == pos[1] then
      col = pos[2] + 1
    elseif row == nil then
      row, col = pos[1], pos[2] + 1
    else
      col = 1
    end
  end

  if row and col then
    if vim.api.nvim_buf_get_name(0) == filename then
      vim.cmd([[normal! m']])
    end
    local ok, err_msg = pcall(vim.api.nvim_win_set_cursor, 0, { row, col })
    if not ok then
      log.debug('Failed to move to cursor:', err_msg, row, col)
    end
  end
end

local mapping_values = {
  ['<CR>'] = function()
    return open_with_slash('edit')
  end,
  ['<C-x>'] = function()
    return open_with_slash('new')
  end,
  ['<C-v>'] = function()
    return open_with_slash('vnew')
  end,
  ['<C-t>'] = function()
    return open_with_slash('tabedit')
  end,
}

local override_mappings = { i = mapping_values, n = mapping_values }

require('telescope').setup({
  defaults = {
    mappings = { n = { ['q'] = 'close' } },
  },
  pickers = {
    fd = { mappings = override_mappings },
    find_files = { mappings = override_mappings },
    live_grep = { mappings = override_mappings },
  },
})

local opts = require('utils.keymap_opts')

vim.keymap.set({ 'n' }, '<leader>ff', ':Telescope fd<CR>', opts)
vim.keymap.set({ 'n' }, '<leader>fb', ':Telescope buffers<CR>', opts)
vim.keymap.set({ 'n' }, '<leader>fl', ':Telescope live_grep<CR>', opts)
