-- Fuzzy finder
return {
  {
    -- https://github.com/nvim-telescope/telescope.nvim
    "nvim-telescope/telescope.nvim",
    --  lazy = true, -- If true, will only load the plugin on an ad-hoc basis, so I comment out this line

    branch = "0.1.x",

    dependencies = {
      -- https://github.com/nvim-lua/plenary.nvim
      { "nvim-lua/plenary.nvim" },
      {
        -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },

    opts = {
      defaults = {
        layout_config = {
          vertical = {
            width = 0.75,
          },
        },
      },
    },

    keys = {
      {
        "<leader>ff",
        function()
          -- builtin.find_files({ hidden = true, no_ignore = true }) -- I'm still considering whether to use these options
          require("telescope.builtin").find_files()
        end,
        desc = "find files",
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "live grep",
      },
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "find buffers",
      },
      {
        "<leader>fh",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "help tags",
      },
      {
        "<leader>fs",
        function()
          require("telescope.builtin").current_buffer_fuzzy_find()
        end,
        desc = "current buffer fuzzy find",
      },
      {
        "<leader>fo",
        function()
          require("telescope.builtin").lsp_document_symbols()
        end,
        desc = "lsp document symbols",
      },
      {
        "<leader>fi",
        function()
          require("telescope.builtin").lsp_incoming_calls()
        end,
        desc = "lsp incoming calls",
      },
      {
        "<leader>fm",
        function()
          require("telescope.builtin").treesitter({ default_text = ":method:" })
        end,
        desc = "treesitter",
      },
      {
        "<leader>fw",
        function()
          local word = vim.fn.expand("<cword>")
          require("telescope.builtin").grep_string({ search = word })
        end,
        desc = "grep word",
        -- In Vim, a "word" is a sequence of letters, digits and underscores,
        -- or a sequence of other non-blank characters, separated with white space.
      },
      {
        "<leader>fW",
        function()
          local word = vim.fn.expand("<cWORD>")
          require("telescope.builtin").grep_string({ search = word })
        end,
        desc = "grep WORD",
        -- In Vim, a "WORD" is a sequence of non-blank characters, separated with white space.
        -- This means it includes punctuation and other special characters as part of the WORD.
      },
    }
  },
  {
    -- https://github.com/nvim-telescope/telescope-ui-select.nvim
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }

          }
        }
      }
      require("telescope").load_extension("ui-select")
    end

  }
}
