local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>wf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>ws', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = 'Telescope find in files' })

--[[
local M = {}

M.map = function(ss, opts)

  return {
    TelescopeMatching = { fg = ss.diagnostics.hint },
    TelescopeSelection = { fg = ss.diagnostics.hint, bg = ss.bg.cursorline },

    TelescopePromptTitle = { fg = ss.bg.floating, bg = ss.syntax.keyword, bold = true },
    TelescopePromptPrefix = { fg = ss.diagnostics.hint },
    TelescopePromptCounter = { fg = ss.diagnostics.hint },
    TelescopePromptNormal = { bg = ss.bg.cursorline },
    TelescopePromptBorder = { fg = ss.bg.cursorline, bg = ss.bg.cursorline },

    TelescopeResultsTitle = { fg = ss.bg.floating, bg = ss.bg.floating, bold = true },
    TelescopeResultsNormal = { bg = ss.bg.floating },
    TelescopeResultsBorder = { fg = ss.bg.floating, bg = ss.bg.floating },

    TelescopePreviewTitle = { fg = ss.bg.floating, bg = ss.syntax.string, bold = true },
    TelescopePreviewNormal = { bg = ss.bg.floating },
    TelescopePreviewBorder = { fg = ss.bg.floating, bg = ss.bg.floating },
  }
end

return M
]]--
