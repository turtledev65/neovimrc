-- Remap Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Better Window Navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

-- Center words when going to the next and previous one
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Clear search highlight on Esc
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Move text up and down
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==')
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==')
vim.keymap.set('x', '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('x', '<A-k>', ":m '<-2<CR>gv=gv")

-- Enter normal mode with jk
vim.keymap.set('i', 'jk', '<ESC>')

vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- Reload Config
vim.keymap.set('n', '<leader><leader>', function()
  vim.cmd('so')
end)
