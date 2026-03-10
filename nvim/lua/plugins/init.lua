return {
    {
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "onedark",
		},
	}, 
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "lua",
                    "bash",
                    "python",
                    "javascript",
                    "typescript",
                    "tsx",
                    "css",
                    "html",
                    "json",
                    "prisma",  -- Prisma syntax highlighting
                },
				highlight = {
                    enable = true
                },
                indent = {
                    enable = true
                },
			})
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {},
	},
    {
	    "folke/which-key.nvim",
    },
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("onedark").setup({
				style = "darker",
			})
			-- Enable theme
			require("onedark").load()
		end,
	},
}
