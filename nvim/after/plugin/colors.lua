-- :hi to view all 

require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = true,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = 'wave',              -- Load 'wave' theme
    background = {               -- map the value of 'background' option to a theme
        dark = 'wave',           -- try 'dragon' !
        light = 'lotus'
    },
})

vim.cmd('colorscheme kanagawa')

function ApplyColorSceme(scheme)
	scheme = scheme or 'rose-pine'
	vim.cmd('colorscheme ' .. scheme)

    local groups = {
        'NormalFloat',
        'Float',
        'LineNr',
        'NonText',
        'SignColumn',
        'StatusLine',
        'StatusLineNC',
        'EndOfBuffer',
        'FloatBorder',
        'FloatTitle',
        'TelescopeBorder',
        'DiagnosticSignError',
        'DiagnosticSignWarn',
        'DiagnosticSignInfo',
        'DiagnosticSignHint',
        'PMenu', -- code complition window
        'BlinkCmpMenuBorder', -- code complition window border
        'PMenuExtra' -- code complition window references etc
    }

    for _,groupName in pairs(groups) do
        local group = vim.api.nvim_get_hl(0, { name = groupName, link = false, create = false })
        local new_group = vim.tbl_extend('force', group, { bg = 'none' })
        vim.api.nvim_set_hl(0, groupName, new_group)
    end

    local TcSelection = vim.api.nvim_get_hl(
        0,
        { name = 'TelescopeSelection', link = false, create = false }
    )
    vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', TcSelection)

    -- add infill to inactive status line
    vim.opt.fillchars = { stlnc = '⠂' }
end

ApplyColorSceme('kanagawa-wave')
