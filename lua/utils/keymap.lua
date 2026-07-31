local opts = { silent = true, noremap = true }

--- Helper function to set keymaps with default options and description.
---@param modes string|string[] Mode or list of modes (e.g., 'n', { 'n', 'v' })
---@param lhs string Left-hand side of the map (the key sequence)
---@param rhs string|function Right-hand side of the map (command or Lua function)
---@param desc string Description of the keymap
local function map(modes, lhs, rhs, desc)
  vim.keymap.set(modes, lhs, rhs, vim.tbl_extend('force', opts, { desc = desc }))
end

return map
