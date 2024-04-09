-- See more alpha themes at https://github.com/goolord/alpha-nvim/discussions/16
local footer = {
	"hello nerd, welcome to the world of nvim",
}

return {
	-- https://github.com/goolord/alpha-nvim
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
    -- todo: randomize the headers
		local header = require("plugins.headers.cyberpunk-lucy")

		-- Set header
		dashboard.section.header.val = header.header()
		dashboard.section.header.opts.hl = header.hl()

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
