-- map leader to space
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- use simpler escape combinations
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {noremap = true})
--vim.api.nvim_set_keymap('i', 'kj', '<Esc>', {noremap = true})
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = true})

-- map leader w/q to write and quit
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', {noremap = true, silent = true})

-- better tabbing in visual mode
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- better pane movements
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- resize windows
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', {noremap = true, silent = true});
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', {noremap = true, silent = true});
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', {noremap = true, silent = true});
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', {noremap = true, silent = true});

-- nvim-tree keybindings
vim.api.nvim_set_keymap('n', '<C-Space>', ':NvimTreeToggle<CR>', {noremap = true, silent = true});

-- telescope shortcuts
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', {noremap = true, silent = true});
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', {noremap = true, silent = true});
