local opt = vim.opt

opt.guicursor = ""

-- Line Number
opt.number = true
opt.relativenumber = true

-- Tabs and Indentation
opt.tabstop = 4    -- Number of spaces that a <Tab> in the file counts for
opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
-- Use spaces instead of tabs, so when you hit <Tab> it inserts spaces instead of a tab character
-- To insert a real tab when 'expandtab' is on, use CTRL-V<Tab>.
opt.expandtab = true
opt.autoindent = true -- Copy indent from current line when starting a new line
-- Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>
opt.softtabstop = 4

-- Line Wrapping
opt.wrap = true
opt.linebreak = true -- Wrap long lines at a character in 'breakat'
opt.textwidth = 0
opt.wrapmargin = 0

-- Search Settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Cursor Line
opt.cursorline = true
opt.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor

-- Appearance
opt.termguicolors = true -- Enable 24-bit RGB color in the TUI
opt.background = "dark"  -- Set the default background to dark
opt.signcolumn = "yes"   -- Always show the sign column, otherwise it would shift the text each time
opt.colorcolumn = "120"  -- Highlight the 120th column
vim.diagnostic.config({
    float = {
        border = "rounded", -- add rounded border to the diagnostics
    },
})

-- Backspace
opt.backspace = "indent,eol,start" -- Allow backspacing over everything in insert mode

-- Clipboard
vim.api.nvim_set_option("clipboard", "unnamed")

-- Split Window
opt.splitright = true
opt.splitbelow = true

-- Disable Swap and Backup
opt.swapfile = false
opt.backup = false

-- Undodir
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Listchars
opt.isfname:append("@-@") -- Add @ to the list of characters that are allowed in a file name
opt.iskeyword:append("-") -- Add - to the list of characters that are allowed in a word

-- CursorHold
opt.updatetime = 50 -- I disable swapfile, so it only used for CursorHold autocommand events

-- Mouse
-- opt.mouse = "" -- Disable mouse support

-- Folding
opt.foldlevel = 20                          -- Maximum fold depth when starting editing
opt.foldmethod = "expr"                     -- Use expression to determine folds
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Use treesitter to determine folds
