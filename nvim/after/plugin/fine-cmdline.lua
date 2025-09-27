require('fine-cmdline').setup({
    popup = {
        relative = "editor"
    }
})

vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
