return {
  -- https://github.com/CRAG666/code_runner.nvim
  "CRAG666/code_runner.nvim",
  opts = {
    filetypes = {
      python = {
        "python3 -u",
      },
    },
  },
  keys = {
    { '<leader>r',   ':RunCode<CR>',     { noremap = true, silent = false } },
    { '<leader>rf',  ':RunFile<CR>',     { noremap = true, silent = false } },
    { '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false } },
    { '<leader>rp',  ':RunProject<CR>',  { noremap = true, silent = false } },
    { '<leader>rc',  ':RunClose<CR>',    { noremap = true, silent = false } },
    { '<leader>crf', ':CRFiletype<CR>',  { noremap = true, silent = false } },
    { '<leader>crp', ':CRProjects<CR>',  { noremap = true, silent = false } },
  },
}
