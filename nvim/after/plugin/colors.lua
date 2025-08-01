function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd("colorscheme " .. color)

    local groups = {
        'Normal',
        'NormalFloat',
        'NormalNC',
        --[[
        'Comment',
        'Constant',
        'Special',
        'Identifier',
        'Statement',
        'PreProc',
        'Type',
        'Underlined',
        'Todo',
        'String',
        'Function',
        'Conditional',
        'Repeat',
        'Operator',
        'Structure',
        'LineNr',
        'NonText',
        'SignColumn',
        ]]
        'CursorLine',
        'CursorLineNr',
        'StatusLine',
        'StatusLineNC',
        'EndOfBuffer',
        'FloatBorder',
        'TelescopeNormal',
        'TelescopePreviewBorder',
        'TelescopeResultsBorder',
        'TelescopePromptBorder'
    }

    for _,group in pairs(groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none" })
    end
end

ColorMyPencils()
