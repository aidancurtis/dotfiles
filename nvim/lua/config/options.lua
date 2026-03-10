vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.wrap = false -- Don't wrap long lines
vim.opt.cursorline = true -- Highlight current line
vim.opt.scrolloff = 8 -- Keep 8 lines above/below cursor when scrolling
vim.opt.signcolumn = "yes" -- Always show signcolumn (for LSP, git, etc.)
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.splitbelow = true -- Horizontal splits go below
vim.opt.splitright = true -- Vertical splits go to the right
vim.opt.softtabstop = 4
vim.opt_local.indentexpr = ""

vim.g.autoformat = false
vim.g.css_recommended_style = 0
vim.g.netrw_liststyle = 3

vim.g.python_recommended_style = 0

vim.g.venv_select_branch = nil
-- vim.g.python3_host_prog = "/opt/homebrew/bin/python3"

vim.opt.exrc = true
vim.opt.secure = true
