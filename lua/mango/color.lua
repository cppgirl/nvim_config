local isTransparent = true

local changeTransparent = function()
    isTransparent = not isTransparent
    vim.cmd.colorscheme(vim.g.colors_name)
end

local toggleBackgroundColor = function()
    if (vim.o.background == 'light') then
        vim.o.background = 'dark'
    else
        vim.o.background = 'light'
    end
end

vim.api.nvim_create_autocmd('ColorScheme', {
    desc = 'Change Of Color',
    callback = function()
        if isTransparent then
            vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
            vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

            vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'NONE' })
            vim.api.nvim_set_hl(0, 'PmenuBorder', { bg = 'NONE', fg = "#A0FF00" })
        else
            vim.api.nvim_set_hl(0, 'PmenuBorder', { fg = "#A0FF00" })
        end
    end,
})

vim.keymap.set({ 'n', 'x' }, '<leader>ct', changeTransparent, {
    desc = 'Change Background Transparency'
})
vim.keymap.set({ 'n', 'x' }, '<leader>cb', toggleBackgroundColor, {
    desc = 'Toggle Dark and Light Background'
})

vim.cmd([[
    highlight CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
    highlight CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

    highlight MyError guifg=Red guibg=Yellow
    highlight MyWarning guifg=Blue

    highlight MyHighlight1 guibg=Red
    highlight MyHighlight2 guibg=Yellow
    highlight MyHighlight3 guibg=Blue
    highlight MyHighlight4 guibg=Green
    highlight MyHighlight5 guibg=Pink
    highlight MyHighlight6 guibg=Purple
]])

local function matchaddpos(x)
    return function()
        vim.fn.matchaddpos('MyHighlight' .. x, { vim.fn.line('.') })
    end
end

vim.keymap.set('n', '<leader>ll', function()
    vim.wo.cursorline = not vim.wo.cursorline
    vim.wo.cursorcolumn = not vim.wo.cursorcolumn
end, {
    desc = 'pointer',
    silent = true
})

vim.keymap.set('n', '<leader>l0', vim.fn.clearmatches, { desc = 'Clear Colored Lines' })
vim.keymap.set('n', '<leader>l1', matchaddpos('1'), { desc = 'Color Line 1' })
vim.keymap.set('n', '<leader>l2', matchaddpos('2'), { desc = 'Color Line 2' })
vim.keymap.set('n', '<leader>l3', matchaddpos('3'), { desc = 'Color Line 3' })
vim.keymap.set('n', '<leader>l4', matchaddpos('4'), { desc = 'Color Line 4' })
vim.keymap.set('n', '<leader>l5', matchaddpos('5'), { desc = 'Color Line 5' })
vim.keymap.set('n', '<leader>l6', matchaddpos('6'), { desc = 'Color Line 6' })

vim.cmd.colorscheme('tokyonight-night')
