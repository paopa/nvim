-- Github Copilot and Chat
return {
	{
		-- https://github.com/zbirenbaum/copilot.lua
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = {
				enabled = false,
				auto_trigger = true,
			},
			panel = {
				enabled = false,
			},
			filetypes = {
				markdown = true,
				yaml = true,
				["."] = true,
			},
		},
	},

	{
		-- https://github.com/zbirenbaum/copilot-cmp
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
			local cmp = require("cmp")
			local has_words_before = function()
				if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
					return false
				end
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
			end
			cmp.setup({
				mapping = {
					["<Tab>"] = vim.schedule_wrap(function(fallback)
						if cmp.visible() and has_words_before() then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						else
							fallback()
						end
					end),
				},
			})
		end,
	},

	{
		-- https://github.com/CopilotC-Nvim/CopilotChat.nvim
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			debug = true, -- Enable debugging
			-- See Configuration section for rest
		},
		keys = {
			{ "<leader>cc", ":CopilotChat<CR>", desc = "Open Copilot Chat" },
			{ "<leader>ccc", ":CopilotChatClose<CR>", desc = "Close Copilot Chat" },
			{ "<leader>cccs", ":CopilotChatCommitStaged<CR>", desc = "Commit Staged Changes" },
			{ "<leader>cce", "<cmd>CopilotChatExplain<CR>", desc = "Explain Copilot Suggestion" },
			{ "<leader>ccf", "<cmd>CopilotChatFix<CR>", desc = "Fix Copilot Suggestion" },
			{ "<leader>cco", "<cmd>CopilotChatOptimize<CR>", desc = "Optimize Copilot Suggestion" },
		},
	},
}
