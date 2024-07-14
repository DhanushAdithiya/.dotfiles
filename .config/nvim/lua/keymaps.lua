vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-b>', ':Explore<CR>', { noremap = true, silent = true })
vim.keymap.set('x', '<', '<gv')
vim.keymap.set('x', '>', '>gv')

--SPLIT SCREEN NAVIGATION
vim.keymap.set('n', '<m-k>', ':wincmd k<CR>', {silent = true})
vim.keymap.set('n', '<m-j>', ':wincmd j<CR>', {silent = true})
vim.keymap.set('n', '<m-h>', ':wincmd h<CR>', {silent = true})
vim.keymap.set('n', '<m-l>', ':wincmd l<CR>', {silent = true})

-- LSP KEYMAPS
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {})
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {})
vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols)
vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols)
vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})


-- STOLEN REMAPS
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "Q", "<nop>")

-- TELESCOPE
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })

vim.keymap.set('n', '<leader>sw', function()
	local word = vim.fn.expand("<cword>")
	builtin.grep_string({ search = word })
end)

vim.keymap.set('n', '<leader>sW', function()
	local word = vim.fn.expand("<cWORD>")
	builtin.grep_string({ search = word })
end)
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- UNDO TREE
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

--HARPOON
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- HARPOON
vim.keymap.set("n", "<leader>h", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.cmd [[command! W w]]
vim.cmd [[command! Q q]]
vim.cmd [[command! Wq wq]]

-- FUGITIVE keymap
vim.keymap.set('n', '<leader>vfd', ':below G diff %<CR>', { noremap = true })
vim.keymap.set('n', '<leader>vfgd', ':below G diff<CR>', { noremap = true })
vim.keymap.set('n', '<leader>vfl', ':below G log<CR>', { noremap = true })
vim.keymap.set('n', '<leader>vfs', ':below G status<CR>', { noremap = true })
vim.keymap.set('n', '<leader>vfc', ':below G commit<CR>', { noremap = true })
vim.keymap.set('n', '<leader>vfp', ':below G push<CR>', { noremap = true })
vim.keymap.set('n', '<leader>vfg', ':below G <CR>', { noremap = true })


-- GIT BLAME
vim.keymap.set('n', '<leader>be', ':GitBlameEnable <CR>', { noremap = true })
vim.keymap.set('n', '<leader>bd', ':GitBlameDisable <CR>', { noremap = true })
vim.keymap.set("n", "<leader>gs", ":Gitsigns toggle_signs <CR>", { noremap = true })

-- THEMERY
vim.keymap.set("n", "<leader>th", ":Themery <CR>", { noremap = true })

function BlackBg()
	vim.api.nvim_set_hl(0, "Normal", { bg = "None"})
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })
end

vim.keymap.set("n", "<leader>bg", ":lua BlackBg() <CR>")
