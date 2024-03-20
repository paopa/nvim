return {
  -- https://github.com/akinsho/toggleterm.nvim
  'akinsho/toggleterm.nvim',
  version = "*",
  opts    = {
    direction = 'float',
  },
  config  = function(_, opts)
    require('toggleterm').setup(opts)

    local keymap = vim.keymap
    keymap.set("n", "<leader>tt", ":ToggleTerm<CR>") -- open terminal
    -- I saw the answer to solve how to exit terminal in the neovim in the following link
    -- https://www.reddit.com/r/neovim/comments/wk1vcc/how_to_exit_terminal_or_float_term/
    keymap.set('t', '<C-t>', '<C-\\><C-n>:ToggleTerm<CR>', { noremap = true, silent = true })

    -- lazygit
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
  end
}
