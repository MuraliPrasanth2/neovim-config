-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true })
vim.keymap.set("n", "<leader>P", ":!python3 main.py<CR>", { noremap = true })
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true })
vim.keymap.set("v", "<C-s>", ":w<CR>", { noremap = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { noremap = true })
