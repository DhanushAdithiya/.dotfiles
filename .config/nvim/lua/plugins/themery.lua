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
					name = "naysayer",
					colorscheme = "naysayer"
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
					before = [[
					require("onedark").setup({
						-- Main options --
		style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
		transparent = true,  -- Show/hide background
		term_colors = true, -- Change terminal color as per the selected theme style
		ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
		cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

		-- toggle theme style ---
		toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
		toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

		-- Change code style ---
		-- Options are italic, bold, underline, none
		-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
		code_style = {
				comments = 'italic',

				keywords = 'none',
				functions = 'none',
				strings = 'none',
				variables = 'none'
		},

		-- Lualine options --
		lualine = {
				transparent = false, -- lualine center bar transparency
		},


		-- Custom Highlights --
		colors = {}, -- Override default colors
		highlights = {}, -- Override highlight groups


		-- Plugins Config --

		diagnostics = {
				darker = true, -- darker colors for diagnostic

				undercurl = true,   -- use undercurl instead of underline for diagnostics
				background = true,    -- use background color for virtual text
		},
					})
					]]
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
			livePreview = true,                            -- Apply theme while browsing. Default to true.
		})
	end
}
