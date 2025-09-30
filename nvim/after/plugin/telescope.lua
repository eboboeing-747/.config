require("telescope").setup({
    pickers = {
        find_files = {
            push_tagstack_on_edit = true,
        },
    },
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>g', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = 'Telescope find in files' })
