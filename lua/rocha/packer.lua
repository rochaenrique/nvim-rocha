-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '3.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'mfussenegger/nvim-jdtls'

    use 'mfussenegger/nvim-dap'

    -- use 'mg979/vim-visual-multi'

    -- use { "rose-pine/neovim", as = "rose-pine" }
    -- use "blazkowolf/gruber-darker.nvim"
    use "rebelot/kanagawa.nvim"

    use('nvim-treesitter/nvim-treesitter', { as = ':TSUpdate'})

    use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
    use "tpope/vim-fugitive" 
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
end)
