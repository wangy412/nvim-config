vim.cmd [[packadd packer.nvim]]

require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use "EdenEast/nightfox.nvim"
    use "neovim/nvim-lspconfig"
    use "nvim-lua/lsp-status.nvim"
    use "hrsh7th/nvim-compe"
    use "kyazdani42/nvim-web-devicons"
    use "karb94/neoscroll.nvim"
    use "onsails/lspkind-nvim"
    use "norcalli/nvim-colorizer.lua"
    use "b3nj5m1n/kommentary"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "mhartington/formatter.nvim"
    use "tpope/vim-eunuch"
    use "tpope/vim-liquid"
    use "tpope/vim-fugitive"
    use "neovimhaskell/haskell-vim"
    use "tpope/vim-surround"
    use "chaoren/vim-wordmotion"
    use "plasticboy/vim-markdown"
    use "mattn/emmet-vim"
    use "L3MON4D3/LuaSnip"
    use "knubie/vim-kitty-navigator"
    use "fladson/vim-kitty"
    use "kosayoda/nvim-lightbulb"
    use "dhruvasagar/vim-table-mode"
    use "vim-pandoc/vim-pandoc-syntax"
    use "vim-pandoc/vim-pandoc"
    use "andweeb/presence.nvim"
    use "tikhomirov/vim-glsl"
    use {
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    }
    use "famiu/feline.nvim"
    use {
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    }
    use {
        "kyazdani42/nvim-tree.lua",
        requires = { "kyazdani42/nvim-web-devicons" },
    }
    use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "~/Documents/Coding/Vim/nvim-scratchpad"
end)
