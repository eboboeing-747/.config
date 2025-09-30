require("mason").setup({
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
    ensure_installed = {
        "roslyn",
        "rzls"
    },
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "󰄰"
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
