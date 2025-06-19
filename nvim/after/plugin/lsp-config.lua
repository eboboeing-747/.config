require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
        border = "rounded"
    }
})

require("mason-lspconfig").setup {
    automatic_enable = true
}

vim.diagnostic.config({
    virtual_text = true
})
