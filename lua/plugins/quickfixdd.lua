-- Adds delete functionality to quickfix list (keymap dd)
return {
  -- https://github.com/TamaMcGlinn/quickfixdd
  'TamaMcGlinn/quickfixdd',
  event = 'VeryLazy',
  config = function()
    local keymap = vim.keymap
    keymap.set("n", "<leader>qo", ":copen<CR>") -- open quickfix list
    keymap.set("n", "<leader>qf", ":cfirst<CR>") -- jump to first quickfix list item
    keymap.set("n", "<leader>qn", ":cnext<CR>") -- jump to next quickfix list item
    keymap.set("n", "<leader>qp", ":cprev<CR>") -- jump to prev quickfix list item
    keymap.set("n", "<leader>ql", ":clast<CR>") -- jump to last quickfix list item
    keymap.set("n", "<leader>qc", ":cclose<CR>") -- close quickfix list
  end,
}
-- I'm not sure the use case for this plugin. but I'm going to keep it a while to see if it's useful.
