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
  config = function()
    require("code_runner").setup()

    vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
  end
}
