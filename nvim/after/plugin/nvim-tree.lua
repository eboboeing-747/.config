local function get_window_opts()
    local width = math.floor(vim.o.columns * 0.3)
    local height = math.floor(vim.o.lines * 0.5)

    return {
        relative = "editor",
        border = "rounded",
        width = width,
        height = height,
        col = math.floor((vim.o.columns - width) / 2),
        row = math.floor((vim.o.lines - height) / 2)
    }
end

require('nvim-tree').setup({
    view = {
        float = {
            enable = true,
            quit_on_focus_loss = true,
            open_win_config = get_window_opts
        }
    }
})
