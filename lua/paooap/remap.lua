
vim.g.mapleader = " "


-- it will delete the selected text and paste the content in the default register to the current position
vim.keymap.set("x", "<leader>p", [["_dP]])

-- this commands use to copy the selected text to the system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])


