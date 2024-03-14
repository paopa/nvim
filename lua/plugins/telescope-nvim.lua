-- Fuzzy finder
return {
  -- https://github.com/nvim-telescope/telescope.nvim
  'nvim-telescope/telescope.nvim',
--  lazy = true, -- If true, will only load the plugin on an ad-hoc basis, so I comment out this line

  branch = '0.1.x',

  dependencies = {
    -- https://github.com/nvim-lua/plenary.nvim
    { 'nvim-lua/plenary.nvim' },
    {
      -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },

  opts = {
    defaults = {
      layout_config = {
        vertical = {
          width = 0.75
        }
      }
    }
  },

  config = function()
    require('telescope').setup({})

    local builtin = require('telescope.builtin')
    local keymap = vim.keymap

    keymap.set('n', '<leader>ff', builtin.find_files, {})
    keymap.set('n', '<leader>fg', builtin.live_grep, {})
    keymap.set('n', '<leader>fb', builtin.buffers, {})
    keymap.set('n', '<leader>fh', builtin.help_tags, {})    
    keymap.set('n', '<leader>fs', builtin.current_buffer_fuzzy_find, {})
    keymap.set('n', '<leader>fo', builtin.lsp_document_symbols, {})
    keymap.set('n', '<leader>fi', builtin.lsp_incoming_calls, {})
    keymap.set('n', '<leader>fm', function() 
        builtin.treesitter({default_text=":method:"})
    end)

    -- what is the difference between <leader>fw and <leader>fW?
    
    -- In Vim, a "word" is a sequence of letters, digits and underscores, 
    -- or a sequence of other non-blank characters, separated with white space.
    keymap.set('n', '<leader>fw', function()
        local word = vim.fn.expand("<cword>") 
        builtin.grep_string({ search = word })
    end)
    -- In Vim, a "WORD" is a sequence of non-blank characters, separated with white space. 
    -- This means it includes punctuation and other special characters as part of the WORD.
    keymap.set('n', '<leader>fW', function()
        local word = vim.fn.expand("<cWORD>")
        builtin.grep_string({ search = word })
    end)

  end
}
