vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>wv", ":Ex<CR>")
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.lsp.foldexpr()"

-- prevents {} motions from opening folds on hover
vim.keymap.set('n', '{', function()
  return vim.fn.foldclosed(vim.fn.search('^$', 'Wnb')) == -1 and '{' or '{k'
end, { expr = true, noremap = true })
vim.keymap.set('n', '}', function()
  return vim.fn.foldclosed(vim.fn.search('^$', 'Wn')) == -1 and '}' or '}j'
end, { expr = true, noremap = true })

vim.keymap.set("n", "<space>t", ":Fterm<CR>")

-- Alt + vim mitions to navigate between panes
vim.keymap.set('n', '<M-h>', "<C-w>h")
vim.keymap.set('n', '<M-j>', "<C-w>j")
vim.keymap.set('n', '<M-k>', "<C-w>k")
vim.keymap.set('n', '<M-l>', "<C-w>l")

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        local opts = { buffer = args.opts }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opts)

        -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = false})
        end

        --[[
        -- Auto-format ("lint") on save.
        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                end,
            })
        end
        ]]--
    end,
})
