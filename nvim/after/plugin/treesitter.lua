require('nvim-treesitter.configs').setup {
    ensure_installed = { "c", "lua", "vim", "vue", "html", "css", "typescript" },
    auto_install = false,
    sync_install = false,
    ignore_install = { },
    modules = { }
}
