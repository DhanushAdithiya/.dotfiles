return {
	"zaldih/themery.nvim",
	config = function()
		require("themery").setup({
			themes = {
				{
					name = "vscode",
					colorscheme = "vscode"
				},
				{
					name = "decay",
					colorscheme = "decay"
				},
				{
					name = "gruvbox",
					colorscheme = "gruvbox"
				},
				{
					name = "onedark",
					colorscheme = "onedark",
				},

				{
					name = "tokyonight",
					colorscheme = "tokyonight-night"
				},

				{
					name = "cat-mocha",
					colorscheme = "catppuccin-mocha"
				},

				{
					name = "cat-mach",
					colorscheme = "catppuccin-macchiato"
				},
				{
					name = "gruber",
					colorscheme = "gruber-darker"
				},
				{
					name = "ayu-dark",
					colorscheme = "ayu-dark"
				},
				{
					name = "ayu-mirage",
					colorscheme = "ayu-mirage"
				},
				{
					name = "rose-pine",
					colorscheme = "rose-pine",
					before = [[
					require("rose-pine").setup({

								enable = {
						terminal = true,
						legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
						migrations = true, -- Handle deprecated options automatically
				},

				styles = {
						bold = true,
						italic = false,
						transparency = false,
				},	
					})
					]]
				},
				{
					name = "kanagawa",
					colorscheme = "kanagawa",
				},

			},
			themeConfigFile = "~/.config/nvim/lua/theme.lua", -- Described below
			livePreview = true,                            -- Apply theme while browsing. Default to true.
		})
	end
}
