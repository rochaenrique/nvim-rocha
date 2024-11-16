-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'mfussenegger/nvim-jdtls'

    use 'mfussenegger/nvim-dap'

    --use { "rose-pine/neovim", as = "rose-pine" }
    use "blazkowolf/gruber-darker.nvim"

    use('nvim-treesitter/nvim-treesitter', { as = ':TSUpdate'})

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            -- {'williamboman/mason.nvim'},

            {'neovim/nvim-lspconfig'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
            {"williamboman/mason.nvim"},
            {'williamboman/mason-lspconfig.nvim'},
            {"jvyyvnzobzna/znfba-yfcpbasvt.aivz"}
        }
    }

    use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
    use "tpope/vim-fugitive" 
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
end)
