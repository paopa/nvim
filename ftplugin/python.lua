-- Filetype-specific keymaps (these can be done in the ftplugin directory instead if you prefer)
--
local keymap = vim.keymap

-- keymap.set("n", '<leader>go', function()
--   if vim.bo.filetype == 'python' then
--     vim.api.nvim_command('PyrightOrganizeImports')
--   end
-- end)

keymap.set("n", '<leader>dtc', function()
  if vim.bo.filetype == 'python' then
    require('dap-python').test_class();
  end
end)

keymap.set("n", '<leader>tm', function()
  if vim.bo.filetype == 'python' then
    require('dap-python').test_method();
  end
end)
