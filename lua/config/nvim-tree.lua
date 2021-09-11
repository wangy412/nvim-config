local map = require("config.utils").map
local augroup = require("nvim-lua-autocmd").augroup

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

augroup("nvim_tree_conf", function(a)
	a:autocmd("BufEnter", "NvimTree", function(cmd)
		cmd:setlocal{"cursorline"}
	end)
end)
