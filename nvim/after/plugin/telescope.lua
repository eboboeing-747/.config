local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>wf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>wk', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = 'Telescope find in files' })
