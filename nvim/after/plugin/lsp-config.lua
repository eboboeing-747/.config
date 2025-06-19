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

--[[
local capabilities = require("blink.cmp").get_lsp_capabilities()
local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local installed_servers = mason_lspconfig.get_installed_servers()

for _, server_name in ipairs(installed_servers) do
    lspconfig[server_name].setup({ capabilities = capabilities })
end
--]]

vim.diagnostic.config({
    virtual_text = true
})
