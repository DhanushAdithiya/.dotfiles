return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "rust_analyzer","gopls"}
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local on_attach = require("lspconfig.configs").on_attach
			local capabilities = require("lspconfig.configs").capabilities
			local lspconfig = require("lspconfig")
			local util = require("lspconfig/util")
			--
			-- LSP CONFIGS
			--
			lspconfig.jdtls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.tailwindcss.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				enabled = false,
				on_attach = on_attach,
				capabilities = capabilities,
				root_dir = function(fname)
					return util.root_pattern('tsconfig.json', 'jsconfig.json', '.git')(fname) or util.path.dirname(fname)
				end,
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "literal",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = false,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
				},
			})
			lspconfig.vtsls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.eslint.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					pyright = {
						autoImportCompletion = true,
					},
					python = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
						}
					}
				}
			})
			lspconfig.rust_analyzer.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				fileypes = { "rust" },
				root_dir = util.root_pattern("Cargo.toml"),
				settings = {
					['rust_analyzer'] = {
						cargo = {
							allFeatures = true,
						}
					}
				}

			})
		end
	},

	{ -- Autocompletion
		'hrsh7th/nvim-cmp',
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',

			-- Adds LSP completion capabilities
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',

			-- Adds a number of user-friendly snippets
			'rafamadriz/friendly-snippets',
		},

		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
			local cmp = require 'cmp'
			local luasnip = require 'luasnip'
			require('luasnip.loaders.from_vscode').lazy_load()
			luasnip.config.setup {}

			cmp.setup {
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = {
					completeopt = 'menu,menuone,noinsert',
				},
				mapping = cmp.mapping.preset.insert {
					['<C-n>'] = cmp.mapping.select_next_item(),
					['<C-p>'] = cmp.mapping.select_prev_item(),
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete {},
					['<CR>'] = cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					},
					['<Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<S-Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { 'i', 's' }),
				},
				sources = {
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					{ name = 'path' },
				},
			}
		end
	}
}
