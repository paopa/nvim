-- Adds delete functionality to quickfix list (keymap dd)
return {
  -- https://github.com/TamaMcGlinn/quickfixdd
  'TamaMcGlinn/quickfixdd',
  event = 'VeryLazy',
  keys = {
    {"<leader>qo", ":copen<CR>", desc = 'open quickfix list'},
    {"<leader>qf", ":cfirst<CR>", desc = 'jump to first quickfix list item'},
    {"<leader>qn", ":cnext<CR>", desc = 'jump to next quickfix list item'},
    {"<leader>qp", ":cprev<CR>", desc = 'jump to prev quickfix list item'},
    {"<leader>ql", ":clast<CR>", desc = 'jump to last quickfix list item'},
    {"<leader>qc", ":cclose<CR>", desc = 'close quickfix list'},
  },
}
-- I'm not sure the use case for this plugin. but I'm going to keep it a while to see if it's useful.
