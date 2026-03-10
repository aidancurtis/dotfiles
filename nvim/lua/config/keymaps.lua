local opts = { noremap = true, silent = true }

vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set("n", "tt", "i<Tab><Esc>", { noremap = true })

-- Tabs
vim.keymap.set("n", "te", ":tabedit")
vim.keymap.set("n", "<tab>", ":tabnext<Return>", opts)
vim.keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
vim.keymap.set("n", "tw", ":tabclose<Return>", opts)
