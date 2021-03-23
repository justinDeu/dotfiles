-- map leader to space
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- use simpler escape combinations
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {noremap = true})
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', {noremap = true})
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = true})

-- map leader w/q to write and quit
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', {noremap = true, silent = true})

-- better tabbing in visual mode
vim.api.nvim_set_keymap('v', '<', ':<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', ':>gv', {noremap = true, silent = true})
