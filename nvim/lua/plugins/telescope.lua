return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-file-browser.nvim",
			config = function()
				require("telescope").load_extension("file_browser")
			end,
		},
	},
	keys = {
        -- { "<leader>fg", false }, -- remove LazyVim mapping
        -- {
        --     "<leader>fg",
        --     function()
        --         require("telescope.builtin").live_grep()
        --     end,
        --     desc = "Live Grep",
        -- },
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>fd", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
		{
			"<leader>fs",
			function()
				require("telescope").extensions.file_browser.file_browser({
					path = "%:p:h",
					cwd = vim.fn.expand("%:p:h"),
					hidden = true,
					grouped = true,
				})
			end,
			desc = "File Browser (Current Dir)",
		},
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close,
					},
				},
			},
			extensions = {
				hijack_netrw = true,
				respect_gitignore = false,
				hidden = true,
                no_ignore = true,
				grouped = true,
				previewer = false,
				initial_mode = "normal",
				layout_config = { height = 40 },
			},
			pickers = {
				find_files = {
					theme = "ivy",
				},
			},
		})

		-- vim.keymap.set("n", "<leader>fs", extensions.file_browser, { desc = "Telescope file browser" })
		-- vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		-- vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		-- vim.keymap.set("n", "<leader>fc", function()
		-- 	require("telescope.builtin").find_files({
		-- 		prompt_title = "Neovim Config",
		-- 		cwd = vim.fn.stdpath("config"),
		-- 		hidden = true,
		-- 	})
		-- end, { desc = "Find in Neovim config" })

		telescope.load_extension("file_browser")
		-- local fb_actions = require("telescope.extensions.file_browser.actions")
		-- telescope.extensions.file_browser.file_browser({
		-- 	mappings = {
		-- 		["i"] = {
		-- 			["<C-a>"] = fb_actions.create, -- Add file or directory
		-- 			["<C-r>"] = fb_actions.rename,
		-- 			["<C-d>"] = fb_actions.remove,
		-- 			["<C-y>"] = fb_actions.copy,
		-- 			["<C-m>"] = fb_actions.move,
		-- 		},
		-- 		["n"] = {
		-- 			["a"] = fb_actions.create, -- Add file or directory
		-- 			["r"] = fb_actions.rename,
		-- 			["d"] = fb_actions.remove,
		-- 			["y"] = fb_actions.copy,
		-- 			["m"] = fb_actions.move,
		-- 		},
		-- 	},
		-- })
	end,
}
