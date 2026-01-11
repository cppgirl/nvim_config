local getBanner = require('mango.startup.banners')
local getQuote = require('mango.startup.quotes')

local header = {
    type = "text",
    val = getBanner(),
    opts = {
        position = "center",
        hl = "Statement",
    },
}

local footer = {
    type = "text",
    val = getQuote(),
    opts = {
        position = "center",
        hl = "Number",
    },
}

local function button(txt, keybind, sc, keybind_opts)
    local opts = {
        position = "center",
        shortcut = sc,
        cursor = 3,
        width = 50,
        align_shortcut = "right",
        hl_shortcut = 'String',
        hl = 'String'
    }
    if keybind then
        keybind = '<cmd>:' .. keybind .. '<cr>'
        keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
        opts.keymap = { "n", sc, keybind, keybind_opts }
    end

    local function on_press()
        local key = vim.api.nvim_replace_termcodes(keybind or sc .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "t", false)
    end

    return {
        type = "button",
        val = txt,
        on_press = on_press,
        opts = opts,
    }
end

local buttons = {
    type = "group",
    val = {
        button(' Find File', 'Telescope find_files', '<leader>tf'),
        button('󰍉 Find Word', 'Telescope live_grep', '<leader>tg'),
        button(' Recent Files', 'Telescope oldfiles', '<leader>to'),
        button(' File Browser', 'Telescope file_browser', '<leader>tb'),
        button(' Colorschemes', 'Telescope colorscheme', '<leader>tc'),
        button(' New File', 'lua require"startup".new_file()', '<leader>nf'),
        button(' Settings', 'lua vim.cmd.tabnew("Settings") vim.cmd.Ex(vim.fn.stdpath("config"))', 's'),
        button('󰙴 Edit theme', 'lua vim.cmd.tabnew("Settings") vim.cmd.e(vim.fn.stdpath("config") .. "/after/plugin/alpha.lua")', 't'),
    },
    opts = {
        spacing = 1,
    },
}

require('alpha').setup({
    layout = {
        { type = "padding", val = 2 },
        header,
        { type = "padding", val = 2 },
        buttons,
        footer,
    },
    opts = {
        margin = 5,
    },
})
