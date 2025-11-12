local diagnosticConfig = function(virtual_lines)
    vim.diagnostic.config({
        virtual_lines = virtual_lines,
        virtual_text = not virtual_lines,
        signs = true,
        update_in_insert = true,
        underline = true,
        severity_sort = true
    })
end

diagnosticConfig(false)

local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
vim.lsp.enable({'prolog'})
vim.lsp.enable({'haskell-language-server'})

vim.opt.completeopt = { 'menuone', 'noselect', 'popup' }
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }
        local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)

        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'grr', '<cmd>lua vim.lsp.buf.document_highlight()<cr>', opts)
        vim.keymap.set('n', '<ESC>', '<cmd>lua vim.lsp.buf.clear_references()<cr>', opts)

        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

        vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.setqflist()<cr>', opts)
        vim.keymap.set('n', '<leader>ee', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
        vim.keymap.set('n', '<leader>es', function() diagnosticConfig(true) end)
        vim.keymap.set('n', '<leader>ef', function() diagnosticConfig(false) end)
        vim.keymap.set('n', '<leader>en', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
        vim.keymap.set('n', '<leader>ep', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)

        if client:supports_method('textDocument/completion') then
            client.server_capabilities.completionProvider.triggerCharacters = chars
            vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })

            vim.keymap.set('i', '<C-f>', function() vim.snippet.jump(1) end, opts)
            vim.keymap.set('i', '<C-b>', function() vim.snippet.jump(-1) end, opts)
        end
    end,
})
