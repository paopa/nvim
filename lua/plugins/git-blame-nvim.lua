-- Git Blame
return {
  -- https://github.com/f-person/git-blame.nvim
  'f-person/git-blame.nvim',
  event = 'VeryLazy',
  opts = {
    date_format = '%m/%d/%y', -- more concise date format
  },
  config = function()
    require('gitblame').setup {
      -- when I set this false in the opts above, it doesn't work as expected, so I'll set it here
      enabled = false,
    }
    local keymap = vim.keymap
    keymap.set("n", "<leader>gb", "<cmd>GitBlameToggle<CR>") -- toggle git blame
  end,
}
