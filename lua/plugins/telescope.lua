local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function open_with_slash(prompt_bufnr)
  local entry = action_state.get_selected_entry()
  actions.close(prompt_bufnr)

  if not entry then
    return
  end

  local path = entry.path or entry.filename or entry.value
  if type(path) == "string" then
    path = path:gsub("\\", "/")
    vim.cmd("edit " .. vim.fn.fnameescape(path))
  end
end

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<CR>"] = open_with_slash,
      },
      n = {
        ["<CR>"] = open_with_slash,
      },
    },
  },
})

local opts = require('utils.keymap_opts')

vim.keymap.set({ 'n' }, '<leader>ff', ':Telescope find_files<CR>', opts)
vim.keymap.set({ 'n' }, '<leader>fb', ':Telescope buffers<CR>', opts)
vim.keymap.set({ 'n' }, '<leader>fl', ':Telescope live_grep<CR>', opts)
