-- this link is useful to generate ASCII art
-- https://patorjk.com/software/taag
local header = {
	"                                                     ",
	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	"                                                     ",
}

local footer = {
	"hello nerd, welcome to the world of nvim",
}

return {
	-- https://github.com/goolord/alpha-nvim
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- require("alpha").setup(require("alpha.themes.dashboard").config)
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = header

		-- Set menu
		-- find icons at https://www.nerdfonts.com/cheat-sheet
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰍉  > Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("l", "󰒲  > Lazy", ":Lazy<CR>"),
			dashboard.button("m", "󰬔  > Mason", ":Mason<CR>"),
			dashboard.button("q", "󰩈  > Quit NVIM", ":qa<CR>"),
		}

		dashboard.section.footer.val = footer

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[
      autocmd FileType alpha setlocal nofoldenable
    ]])
	end,
}
