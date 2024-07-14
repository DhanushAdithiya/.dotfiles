return  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
     dependencies = { 'nvim-tree/nvim-web-devicons' },
			icons_enabled = true,
        component_separators = '|',
        section_separators = '',
      },
    },
}


