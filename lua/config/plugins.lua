vim.cmd [[packadd packer.nvim]]

require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use "neovim/nvim-lspconfig"
    use "nvim-lua/lsp-status.nvim"

    use "EdenEast/nightfox.nvim"
    use "drewtempelmeyer/palenight.vim"
    use "sainnhe/everforest"
    use "xiyaowong/nvim-transparent"

    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use {
        "hrsh7th/nvim-cmp",
        commit = "4f1358e659d51c69055ac935e618b684cf4f1429",
    }

    use "ggandor/lightspeed.nvim"

    use "kyazdani42/nvim-web-devicons"
    use "stevearc/dressing.nvim"
    use "karb94/neoscroll.nvim"
    use "onsails/lspkind-nvim"
    use "norcalli/nvim-colorizer.lua"
    use "b3nj5m1n/kommentary"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "mhartington/formatter.nvim"
    use "tpope/vim-eunuch"
    use "tpope/vim-liquid"
    use "tpope/vim-fugitive"
    use "tpope/vim-repeat"
    use "neovimhaskell/haskell-vim"
    use "tpope/vim-surround"
    use "chaoren/vim-wordmotion"
    -- use "plasticboy/vim-markdown"
    use "cakebaker/scss-syntax.vim"
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
    use "b0o/SchemaStore.nvim"
    use "ekalinin/Dockerfile.vim"
    use "jghauser/mkdir.nvim"
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
    use "nvim-telescope/telescope-symbols.nvim"
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
end)
