vim.cmd('colorscheme sonokai')

vim.o.guifont = "JetBrainsMono\\ Nerd\\ Font\\ Mono:h18"

vim.wo.number = true

vim.go.termguicolors = true
vim.go.t_Co = "256"
vim.go.t_ut = ""

-- LINE SETTINGS
vim.wo.wrap = false
vim.wo.number = true
vim.wo.relativenumber = false
vim.wo.cursorline = true

-- always show sign column
vim.wo.signcolumn = "yes"

-- SANE SPLITTING DIRECTIONS
vim.o.splitbelow = true
vim.o.splitright = true
