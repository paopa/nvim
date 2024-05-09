-- Set the leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>L", "<cmd>Lazy<CR>")

-- General keymaps
keymap.set("i", "ii", "<ESC>", { desc = "exit insert mode" })
keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "save and quit" })
keymap.set("n", "<leader>ww", ":w<CR>", { desc = "save" })
keymap.set("n", "<leader>q", ":q!<CR>", { desc = "quit without saving" })
keymap.set("n", "gx", ":!open <c-r><c-a><CR>", { desc = "open url under cursor, example: https://github.com/paopa" })

-- it will drop the selected text into black hole register
-- and paste the content in the unnamed(default) register to the current position
keymap.set("x", "<leader>p", [["_dP]])

-- this command uses to copy the whole line text to the system clipboard
keymap.set("n", "<leader>Y", [["+Y]])

-- Split window management
keymap.set("n", "<leader>vs", "<C-w>v", { desc = "vertical split" })
keymap.set("n", "<leader>hs", "<C-w>s", { desc = "horizontal split" })
keymap.set("n", "<leader>es", "<C-w>=", { desc = "equalize split" })
keymap.set("n", "<leader>cs", "<C-w>c", { desc = "close split" })

keymap.set("n", "<leader>sj", "<C-w>j", { desc = "move to split below" })
keymap.set("n", "<leader>sk", "<C-w>k", { desc = "move to split above" })
keymap.set("n", "<leader>sh", "<C-w>h", { desc = "move to split left" })
keymap.set("n", "<leader>sl", "<C-w>l", { desc = "move to split right" })
keymap.set("n", "<leader>sw", "<C-w>w", { desc = "move to next split" })

keymap.set("n", "<leader>sjj", "<C-w>-", { desc = "make split window height shorter" })
keymap.set("n", "<leader>skk", "<C-w>+", { desc = "make split window height taller" })
keymap.set("n", "<leader>sll", "<C-w>>5", { desc = "make split window width wider" })
keymap.set("n", "<leader>shh", "<C-w><5", { desc = "make split window width narrower" })

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "new tab" })
keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "close tab" })
keymap.set("n", "<leader>tco", ":tabonly<CR>", { desc = "close other tabs" })
keymap.set("n", "<leader>]", ":tabnext<CR>", { desc = "next tab" })
keymap.set("n", "<leader>[", ":tabprevious<CR>", { desc = "previous tab" })
