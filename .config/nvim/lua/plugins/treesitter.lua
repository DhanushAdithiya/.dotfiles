return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = { "lua", "tsx", "typescript", "go", "html", "javascript", "markdown", "python", "rust" },
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	}
}
