local horizon_transparent = require('lualine.themes.horizon')

horizon_transparent.normal.c.bg = 'default'
horizon_transparent.visual.c.bg = 'default'
horizon_transparent.replace.c.bg = 'default'
horizon_transparent.insert.c.bg = 'default'
horizon_transparent.inactive.c.bg = 'default'
horizon_transparent.command.c.bg = 'default'

horizon_transparent.normal.b.fg = '#c0caf5'
horizon_transparent.visual.b.fg = '#c0caf5'
horizon_transparent.replace.b.fg = '#c0caf5'
horizon_transparent.insert.b.fg = '#c0caf5'
horizon_transparent.inactive.b.fg = '#c0caf5'
horizon_transparent.command.b.fg = '#c0caf5'

horizon_transparent.normal.c.fg = '#c0caf5'
horizon_transparent.visual.c.fg = '#c0caf5'
horizon_transparent.replace.c.fg = '#c0caf5'
horizon_transparent.insert.c.fg = '#c0caf5'
horizon_transparent.inactive.c.fg = '#c0caf5'
horizon_transparent.command.c.fg = '#c0caf5'

require('lualine').setup({
    options = {
        theme = horizon_transparent,
    },
    sections = {
        lualine_a = {
            {
                'mode',
                icon = '',
                separator = {
                    left = '',
                    right = ''
                },
                padding = {
                    left = 0,
                    right = 1
                },
                color = {
                    fg = '#000000',
                    gui = 'bold'
                }
            }
        },
        lualine_b = {
            {
                'branch',
                icon = ''
            },
            'diff',
            'diagnostics'
        },
        lualine_c = {
            {
                'filename',
                file_status = true,
                path = 1
            }
        },
        lualine_z = {
            {
                'location',
                separator = {
                    right = '',
                    left = ''
                },
                padding = {
                    left = 0,
                    right = 0
                },
                color = {
                    fg = '#000000',
                    gui = 'bold'
                }
            }
        }
    }
})
