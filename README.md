# [@wangy412](https://github.com/wangy412)'s neovim config

## Plugins

This list is probably horribly out of date because I don't remember to update it.
Just... look at lua/config/plugins.lua instead.  
Maybe I'll write a script to automatically update this list sometime.

- [packer.nvim]('https://github.com/wbthomason/packer.nvim')
- [nvim-lspconfig]('https://github.com/neovim/nvim-lspconfig')
- [lsp-status.nvim]('https://github.com/nvim-lua/lsp-status.nvim')
- [nvim-compe]('https://github.com/hrsh7th/nvim-compe')
- [nvim-web-devicons]('https://github.com/kyazdani42/nvim-web-devicons')
- [neoscroll.nvim]('https://github.com/karb94/neoscroll.nvim')
- [lspkind-nvim]('https://github.com/onsails/lspkind-nvim')
- [nvim-colorizer.lua]('https://github.com/norcalli/nvim-colorizer.lua')
- [kommentary]('https://github.com/b3nj5m1n/kommentary')
- [nvim-ts-context-commentstring]('https://github.com/JoosepAlviste/nvim-ts-context-commentstring')
- [formatter.nvim]('https://github.com/mhartington/formatter.nvim')
- [nvim-scratchpad]('https://github.com/wangy412/nvim-scratchpad')
- [vim-enuch]('https://github.com/tpope/vim-enuch')
- [vim-liquid]('https://github.com/tpope/vim-liquid')
- [vim-surround]('https://github.com/tpope/vim-surround')
- [vim-wordmotion]('https://github.com/chaoren/vim-wordmotion')
- [vim-markdown]('https://github.com/plasticboy/vim-markdown')
- [emmet-vim]('https://github.com/mattn/emmet-vim')
- [LuaSnip]('https://github.com/L3MON4D3/LuaSnip')
- [feline.nvim]('https://github.com/famiu/feline.nvim')
- [vim-kitty-navigator]('https://github.com/knubie/vim-kitty-navigator')
- [vim-kitty]('https://github.com/fladson/vim-kitty')
- [gitsigns.nvim]('https://github.com/lewis6991/gitsigns.nvim')
- [nvim-tree.lua]('https://github.com/kyazdani42/nvim-tree.lua',)
- [telescope.nvim]('https://github.com/nvim-telescope/telescope.nvim',)
- [nvim-treesitter]('https://github.com/nvim-treesitter/nvim-treesitter',)

## TODO

- [ ] Use some base 16 colorscheme generator
- [ ] Lazy loading

## Info

### LSP Servers used

Follow instructions
[here](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md) to
install (just search for the corresponding language server name)

- tsserver
- pyright
- hls (haskell language server)
- clangd
- jsonls
- bashls
- html
- diagnosticls
- vuels

### Other tools

This isn't the complete list, I'm not bothered to go around finding every single
tool my config depends on. If anyone is actually looking and finds something I
missed, please open an issue.

- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [stylua](https://github.com/johnnymorganz/stylua)
- [clang format](https://clang.llvm.org/docs/ClangFormat.html)
- [prettier](https://prettier.io/)
