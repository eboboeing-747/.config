local nvim_tmux_nav = require('nvim-tmux-navigation')

nvim_tmux_nav.setup {
    keybindings = {
        left = "<M-h>",
        down = "<M-j>",
        up = "<M-k>",
        right = "<M-l>"
    }
}
