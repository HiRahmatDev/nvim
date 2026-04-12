local action_state = require('telescope.actions.state')
local log = require('telescope.log')
local utils = require('telescope.utils')

local api = vim.api
local Path = require('plenary.path')

local edit_buffer
do
  local map = {
    drop = 'drop',
    ['tab drop'] = 'tab drop',
    edit = 'buffer',
    new = 'sbuffer',
    vnew = 'vert sbuffer',
    ['leftabove new'] = 'leftabove sbuffer',
    ['leftabove vnew'] = 'leftabove vert sbuffer',
    ['rightbelow new'] = 'rightbelow sbuffer',
    ['rightbelow vnew'] = 'rightbelow vert sbuffer',
    ['topleft new'] = 'topleft sbuffer',
    ['topleft vnew'] = 'topleft vert sbuffer',
    ['botright new'] = 'botright sbuffer',
    ['botright vnew'] = 'botright vert sbuffer',
    tabedit = 'tab sb',
  }

  edit_buffer = function(command, bufnr)
    local buf_command = map[command]
    if buf_command == nil then
      local valid_commands = vim.tbl_map(function(cmd)
        return string.format('%q', cmd)
      end, vim.tbl_keys(map))
      table.sort(valid_commands)
      error(
        string.format(
          'There was no associated buffer command for %q.\nValid commands are: %s.',
          command,
          table.concat(valid_commands, ', ')
        )
      )
    end
    if buf_command ~= 'drop' and buf_command ~= 'tab drop' then
      vim.cmd(string.format('%s %d', buf_command, bufnr))
    else
      vim.cmd(string.format('%s %s', buf_command, vim.fn.fnameescape(api.nvim_buf_get_name(bufnr))))
    end
  end
end

local open_with_slash = function(prompt_bufnr, command)
  local entry = action_state.get_selected_entry()

  if not entry then
    utils.notify('actions.set.edit', {
      msg = 'Nothing currently selected',
      level = 'WARN',
    })
    return
  end

  local filename, row, col

  if entry.path or entry.filename then
    filename = entry.path or entry.filename

    -- TODO: Check for off-by-one
    row = entry.row or entry.lnum
    col = entry.col
  elseif not entry.bufnr then
    -- TODO: Might want to remove this and force people
    -- to put stuff into `filename`
    local value = entry.value
    if not value then
      utils.notify('actions.set.edit', {
        msg = 'Could not do anything with blank line...',
        level = 'WARN',
      })
      return
    end

    if type(value) == 'table' then
      value = entry.display
    end

    local sections = vim.split(value, ':')

    filename = sections[1]
    row = tonumber(sections[2])
    col = tonumber(sections[3])
  end

  local entry_bufnr = entry.bufnr

  local picker = action_state.get_current_picker(prompt_bufnr)
  require('telescope.pickers').on_close_prompt(prompt_bufnr)
  pcall(api.nvim_set_current_win, picker.original_win_id)
  local win_id = picker.get_selection_window(picker, entry)

  if picker.push_cursor_on_edit then
    vim.cmd("normal! m'")
  end

  if picker.push_tagstack_on_edit then
    local from = { vim.fn.bufnr('%'), vim.fn.line('.'), vim.fn.col('.'), 0 }
    local items = { { tagname = vim.fn.expand('<cword>'), from = from } }
    vim.fn.settagstack(vim.fn.win_getid(), { items = items }, 't')
  end

  if win_id ~= 0 and api.nvim_get_current_win() ~= win_id then
    api.nvim_set_current_win(win_id)
  end

  if entry_bufnr then
    if not vim.bo[entry_bufnr].buflisted then
      vim.bo[entry_bufnr].buflisted = true
    end
    edit_buffer(command, entry_bufnr)
  else
    -- check if we didn't pick a different buffer
    -- prevents restarting lsp server
    if api.nvim_buf_get_name(0) ~= filename or command ~= 'edit' then
      filename = Path:new(filename):normalize(vim.uv.cwd())
      pcall(vim.cmd, string.format('%s %s', command, vim.fn.fnameescape(vim.fs.normalize(filename))))
    end
  end

  -- HACK: fixes folding: https://github.com/nvim-telescope/telescope.nvim/issues/699
  if vim.wo[0][0].foldmethod == 'expr' then
    vim.schedule(function()
      vim.wo[0][0].foldmethod = 'expr'
    end)
  end

  local pos = api.nvim_win_get_cursor(0)
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
    if api.nvim_buf_get_name(0) == filename then
      vim.cmd([[normal! m']])
    end
    local ok, err_msg = pcall(api.nvim_win_set_cursor, 0, { row, col })
    if not ok then
      log.debug('Failed to move to cursor:', err_msg, row, col)
    end
  end
end

local mapping_values = {
  ['<CR>'] = function(prompt_bufnr)
    return open_with_slash(prompt_bufnr, 'edit')
  end,
  ['<C-x>'] = function(prompt_bufnr)
    return open_with_slash(prompt_bufnr, 'new')
  end,
  ['<C-v>'] = function(prompt_bufnr)
    return open_with_slash(prompt_bufnr, 'vnew')
  end,
  ['<C-t>'] = function(prompt_bufnr)
    return open_with_slash(prompt_bufnr, 'tabedit')
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
