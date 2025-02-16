
vim.g.mapleader = " "

-- vim.keymap.set("n", "<C-a>b", ":lua print('hello world')<CR>", { silent = true })
vim.keymap.set({"n", "i"}, "<C-a>b", "<Cmd>lua print('hello world')<CR>", { silent = true })


vim.keymap.set({ "n", "i" }, "<C-s>", "<Cmd>:w<CR>", { silent = true}) 
vim.keymap.set({ "n", "i" }, "<C-z>", "<Cmd>undo<CR>", { silent = true}) 

vim.keymap.set("n", "<leader>aa", ":lua print(123)<CR>", {})

vim.keymap.set("n", ",a", ":lua a=1<CR>", {})




