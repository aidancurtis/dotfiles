-- plugins/blink.lua
return {
	"jinh0/eyeliner.nvim", -- example plugin
	config = function()
		require("eyeliner").setup({
			highlight_on_key = true,
			dim = true,
		})
	end,
}
