-- Set the leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap


keymap.set("n", "<leader>L", "<cmd>Lazy<CR>")

-- General keymaps
keymap.set("i", "ii", "<ESC>") -- exit insert mode
keymap.set("n", "<leader>wq", ":wq<CR>") -- save and quit
keymap.set("n", "<leader>ww", ":w<CR>") -- save
keymap.set("n", "<leader>q", ":q!<CR>") -- quit without saving
keymap.set("n", "gx", ":!open <c-r><c-a><CR>") -- open url under cursor, example: https://github.com/paopa

-- it will drop the selected text into black hole register 
-- and paste the content in the unnamed(default) register to the current position
keymap.set("x", "<leader>p", [["_dP]])

-- this command uses to copy the whole line text to the system clipboard
keymap.set("n", "<leader>Y", [["+Y]])

-- Split window management
keymap.set("n", "<leader>sv", "<C-w>v") -- vertical split
keymap.set("n", "<leader>sh", "<C-w>s") -- horizontal split
keymap.set("n", "<leader>se", "<C-w>=") -- equalize split
keymap.set("n", "<leader>sc", "<C-w>c") -- close split
keymap.set("n", "<leader>sj", "<C-w>j") -- move to split below
keymap.set("n", "<leader>sk", "<C-w>k") -- move to split above
keymap.set("n", "<leader>sh", "<C-w>h") -- move to split left
keymap.set("n", "<leader>sl", "<C-w>l") -- move to split right
keymap.set("n", "<leader>sw", "<C-w>w") -- move to next split
keymap.set("n", "<leader>sjj", "<C-w>-") -- make split window height shorter
keymap.set("n", "<leader>skk", "<C-w>+") -- make split window height taller
keymap.set("n", "<leader>sll", "<C-w>>5") -- make split window width wider
keymap.set("n", "<leader>shh", "<C-w><5") -- make split window width narrower
