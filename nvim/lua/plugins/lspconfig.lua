-- plugins/lspconfig.lua
return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local lsp_format = require("lsp-format")

            -- Common on_attach function to avoid repetition
            local function on_attach(client, bufnr)
                lsp_format.on_attach(client)
                local opts = { buffer = bufnr, noremap = true, silent = true }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                end
            end

            -- PYTHON LSP
            lspconfig.pyright.setup({
                on_attach = function(client, bufnr)
                    client.server_capabilities.documentFormattingProvider = false
                    on_attach(client, bufnr)
                end,
            })

            -- JAVASCRIPT/TYPESCRIPT LSP
            lspconfig.ts_ls.setup({
                on_attach = on_attach,
                filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
                settings = {
                    typescript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                        },
                    },
                    javascript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                        },
                    },
                },
            })

            -- CSS LSP
            lspconfig.cssls.setup({
                on_attach = on_attach,
                settings = {
                    css = {
                        lint = { unknownAtRules = "ignore" },
                        validate = true,
                    },
                    scss = { lint = { unknownAtRules = "ignore" }, validate = true },
                    less = { lint = { unknownAtRules = "ignore" }, validate = true },
                },
            })

            -- PRISMA LSP
            lspconfig.prismals.setup({
                on_attach = on_attach,
            })

            -- JSON LSP
            lspconfig.jsonls.setup({
                on_attach = on_attach,
                settings = {
                    json = {
                        schemas = require('schemastore').json.schemas(),  -- Use schemastore for automatic JSON schemas
                        validate = { enable = true },
                    },
                },
            })
        end,
    },
    {
        "lukas-reineke/lsp-format.nvim",
        config = function()
            require("lsp-format").setup({})
        end,
    },
}
