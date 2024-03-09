
vim.g.mapleader = " "


-- it will drop the selected text into black hole register 
-- and paste the content in the unnamed(default) register to the current position
vim.keymap.set("x", "<leader>p", [["_dP]])

-- this command uses to copy the whole line text to the system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>L", "<cmd>Lazy<CR>")
