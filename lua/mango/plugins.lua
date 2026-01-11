vim.cmd.packadd('nvim.undotree')

vim.pack.add({
    -- telescope
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/nvim-telescope/telescope.nvim' },
    { src = 'https://github.com/nvim-telescope/telescope-file-browser.nvim' },

    -- kolorki
    { src = 'https://github.com/folke/tokyonight.nvim' },

    -- pobieracze
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter' }, -- treesitter parsers
    { src = 'https://github.com/mason-org/mason.nvim' }, -- everything
    { src = 'https://github.com/neovim/nvim-lspconfig' }, -- lsp default configs
    { src = 'https://github.com/mason-org/mason-lspconfig.nvim' }, -- auto-enabling mason's lsps

    -- some useful things
    { src = 'https://github.com/theprimeagen/harpoon' },
    { src = 'https://github.com/tpope/vim-fugitive' }, -- Git integration
    { src = 'https://github.com/Shatur/neovim-tasks' }, -- Building Tool

    -- ikonki
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
    { src = 'https://github.com/nvim-mini/mini.icons' },

    -- random
    { src = 'https://github.com/goolord/alpha-nvim' },
    { src = 'https://github.com/eandrju/cellular-automaton.nvim' },
    { src = 'https://github.com/folke/which-key.nvim' },
    -- { src = 'https://github.com/dstein64/vim-startuptime' },
})
