local map = require("config.utils").map

-- options
vim.g.nvim_tree_ignore = { ".DS_Store", ".git" }
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_symlink_arrow = " -> "
vim.g.nvim_tree_icons = {
	folder = {
		arrow_closed = "",
		arrow_open = "",
	},
	git = {
		unstaged = "▣",
		staged = "",
		unmerged = "",
		renamed = "➜",
		untracked = "★",
		deleted = "",
		ignored = "◌",
	},
}
map({ "n", "<C-n>", ":NvimTreeToggle<CR>" })
map({ "n", "<leader>r", ":NvimTreeRefresh<CR>" })

vim.cmd([[
augroup NvimTreeConf
    autocmd!
    autocmd BufEnter NvimTree setlocal cursorline
augroup END
]])
