return {
	{
		"luckasRanarison/tailwind-tools.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {} -- your configurations
	},
	{
		'razak17/tailwind-fold.nvim',
		opts = {
			enabled = true,
			-- Only fold when class string char count is more than 30. Folds everything by default.
			min_chars = 0,
			ft = {
				"html",
				"svelte",
				"astro",
				"vue",
				"tsx",
				"php",
				"blade"
			}
		},
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		ft = { 'html', 'svelte', 'astro', 'vue', 'typescriptreact', 'php', 'blade' },
	},
	{
		"windwp/nvim-ts-autotag",
		ft = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
		config = function ()
			require("nvim-ts-autotag").setup()
		end
	}
}
