return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			css = { "prettier" },
            javascript = { "prettier" },
            python = { "ruff_format" },
            html = { "prettier" },
		},
        formatters = {
            ruff_format = {
                command = "uv",
                args = { "run", "ruff", "check", "--fix", "--exit-zero", "-" },
                stdin = true,
            },
            prettier = {
                command = "prettier",
                args = { "--stdin-filepath", "$FILENAME" },
                stdin = true,
            }
        },
	},
}
