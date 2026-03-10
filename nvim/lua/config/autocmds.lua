local conform = require("conform")

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = function()
        conform.format({ async = false })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "css",
  callback = function()
    local view = vim.fn.winsaveview()
    vim.lsp.buf.format({ async = false })
    vim.fn.winrestview(view)
    -- vim.b.autoformat = true
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx" },
  callback = function()
    vim.b.autoformat = true
    require("conform").format({ lsp_fallback = true })
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.html",
    callback = function()
        require("conform").format({ async = false })
    end,
})

vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = {"html", "css"},
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.json",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
