local map = require("config.utils").map

--[ Must Haves ]-- {{{
map({ "i", "jk", "<Esc>", { noremap = true } })

vim.o.syntax = "on"
vim.g.mapleader = " "
--}}}

--[ Colors ]-- {{{
vim.cmd([[
colorscheme onedark_ts

highlight Normal ctermbg=none
highlight EndOfBuffer ctermbg=none
highlight SignColumn ctermbg=none
]])
--}}}

--[ Options ]-- {{{
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

vim.o.signcolumn = "yes"

vim.o.updatetime = 300

vim.o.hlsearch = false

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.foldmethod = "marker"

vim.o.undodir = "~/.vim/undo"
-- }}}

--[ Keymaps ]-- {{{
-- https://www.youtube.com/watch?v=hSHATqh8svM
-- keep cursor centered
map({ "n", "n", "nzzzv" })
map({ "n", "N", "Nzzzv" })
map({ "n", "J", "mzJ`z" })
-- capital y to yank until end of line
map({ "n", "Y", "y$" })
-- undo breakpoints
local breakpointLetters = { ",", ".", "!", "?" }
for _, letter in ipairs(breakpointLetters) do
	map({ "i", letter, letter .. "<c-g>u" })
end
-- jumplist mutations
map({ "n", "k", [[(v:count > 5 ? "m'" . v:count : "") . 'k' ]], { noremap = true, expr = true } })
map({ "n", "j", [[(v:count > 5 ? "m'" . v:count : "") . 'j' ]], { noremap = true, expr = true } })
-- option+backspace to delete word
map({ "i", "<M-BS>", "<C-w>" })
map({ "c", "<M-BS>", "<C-w>" })
--select all
map({ "n", "<leader><leader>", "ggVG" })
-- yank to system clipboard
map({ "v", "<leader>y", [["+y]] })
-- paste from system clipboard
map({ "v", "<leader>p", [["+p]] })
-- F10 to show highlight group
map({
	"n",
	"<F10>",
	[[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>]],
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
-- }}}

--[ Autocommands ]-- {{{
-- disable auto comment
vim.cmd([[
augroup disable_autocomment
    autocmd!
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup end
]])
-- set the colorcolum for markdown
vim.cmd([[
augroup markdown_colorcolumn
    autocmd!
    autocmd Filetype markdown setlocal colorcolumn=81
augroup end
]])

-- tab size
local two_spaces_filetypes = {
	"haskell",
	"html",
	"css",
	"scss",
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
-- }}}

--[ Functions ]-- {{{
_G.load = function(file)
	require("plenary.reload").reload_module(file, true)
	return require(file)
end
-- }}}

--[ Plugins & Plugin config ]-- {{{
require("config")
-- }}}
