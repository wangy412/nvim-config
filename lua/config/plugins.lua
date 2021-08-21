vim.cmd([[packadd packer.nvim]])

require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use("EdenEast/nightfox.nvim")
	use("neovim/nvim-lspconfig")
	use("nvim-lua/lsp-status.nvim")
	use("hrsh7th/nvim-compe")
	use("kyazdani42/nvim-web-devicons")
	use("karb94/neoscroll.nvim")
	use("onsails/lspkind-nvim")
	use("norcalli/nvim-colorizer.lua")
	use("b3nj5m1n/kommentary")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("mhartington/formatter.nvim")
	use("~/Documents/Coding/Vim/nvim-scratchpad")
	use("tpope/vim-eunuch")
	use("tpope/vim-liquid")
	use("neovimhaskell/haskell-vim")
	use("tpope/vim-surround")
	use("chaoren/vim-wordmotion")
	use("plasticboy/vim-markdown")
	use("mattn/emmet-vim")
	use("L3MON4D3/LuaSnip")
	use("knubie/vim-kitty-navigator")
	use("fladson/vim-kitty")
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	-- use({
	-- 	"glepnir/galaxyline.nvim",
	-- 	branch = "main",
	-- 	requires = { "kyazdani42/nvim-web-devicons", opt = true },
	-- })
	use("famiu/feline.nvim")
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
end)
