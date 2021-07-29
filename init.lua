local map = require("plugins.utils").map

--[ Must Haves ]--
map({ "i", "jk", "<Esc>", { noremap = true } })

vim.o.syntax = "on"
vim.g.mapleader = " "

--[ Colors ]--
vim.cmd([[
colorscheme onedark_ts

highlight Normal ctermbg=none
highlight EndOfBuffer ctermbg=none
highlight SignColumn ctermbg=none
]])

--[ Options ]--
vim.cmd("filetype plugin on")

vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.hidden = true
vim.o.mouse = "a"
vim.o.scrolloff = 5

vim.o.wrap = false

vim.o.ignorecase = true

vim.o.backup = false
vim.o.writebackup = false

vim.o.signcolumn = "number"

vim.o.updatetime = 300

vim.o.hlsearch = false

vim.o.splitright = true
vim.o.splitbelow = true

--[ Keymaps ]--

-- option+backspace to delete word
map({ "i", "<M-BS>", "<C-w>", { noremap = true } })
map({ "c", "<M-BS>", "<C-w>", { noremap = true } })
--select all
map({ "n", "<leader><leader>", "ggVG", { noremap = true } })
-- yank to system clipboard
map({ "v", "<leader>y", [["+y]], { noremap = true } })
-- paste from system clipboard
map({ "v", "<leader>p", [["+p]], { noremap = true } })
-- F10 to show highlight group
map({
	"n",
	"<F10>",
	[[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>]],
	{ noremap = true },
})

-- move lines (https://vim.fandom.com/wiki/Moving_lines_up_or_down#Mappings_to_move_lines)
map({ "n", "∆", ":m .+1<CR>==" })
map({ "n", "˚", ":m .-2<CR>==" })
map({ "i", "∆", "<Esc>:m .+1<CR>==gi" })
map({ "i", "˚", "<Esc>:m .-2<CR>==gi" })
map({ "v", "∆", ":m '>+1<CR>gv=gv" })
map({ "v", "˚", ":m '<-2<CR>gv=gv" })

-- switch between splits
map({ "n", "<Left>", "<C-w>h" })
map({ "n", "<Down>", "<C-w>j" })
map({ "n", "<Up>", "<C-w>k" })
map({ "n", "<Right>", "<C-w>l" })
-- making new splits
map({ "n", "<S-Left>", "<C-w>v<C-w>h" })
map({ "n", "<S-Down>", "<C-w>s" })
map({ "n", "<S-Up>", "<C-w>s<C-w>k" })
map({ "n", "<S-Right>", "<C-w>v" })
-- Copyright Tux 2020-2021. Do not reproduce without explicit permission.
-- All reproductions must bear this original unmodified copyright notice.

--[ Autocommands ]--
-- disable auto comment
vim.cmd([[
augroup disable_autocomment
    autocmd!
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup end
]])

-- tab size
local two_spaces_filetypes = {
	"haskell",
	"html",
	"css",
	"javascript",
	"markdown",
	"typescript",
	"typescriptreact",
	"javascriptreact",
	"dart",
	"vue",
	"json",
}
vim.cmd(string.format(
	[[
augroup tab_size
    autocmd!
    autocmd FileType %s setlocal tabstop=2 shiftwidth=2 softtabstop=2
augroup end
]],
	table.concat(two_spaces_filetypes, ",")
))

-- Plugins & Plugin config
require("plugins")
