local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local themes = require("telescope.themes")
local map = require("plugins.utils").map

require("telescope").setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
			-- width = 0.75,
			-- height = 1,
			-- preview_cutoff = 120,
			-- prompt_position = "bottom",
		},
		file_sorter = sorters.get_fuzzy_file,
		file_ignore_patterns = {
			"node_modules",
			"dist",
		},
		generic_sorter = sorters.get_generic_fuzzy_sorter,
		-- path_display = {"shorten"},
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,
	},
})

-- Key Mappings
map({ "n", "<C-p>", "<cmd>lua require('telescope.builtin').find_files()<CR>", { noremap = true } })
map({ "n", "<C-t>", "<cmd>lua require('telescope.builtin').treesitter()<CR>", { noremap = true } })
map({ "n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true } })
map({ "n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true } })
map({ "n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>", { noremap = true } })
map({ "n", "<leader>cc", "<cmd>lua require('telescope.builtin').commands<CR>", { noremap = true } })
map({ "n", "<leader>ch", "<cmd>lua require('telescope.builtin').command_history()<CR>", { noremap = true } })
map({ "n", "<leader>cs", "<cmd>lua require('telescope.builtin').colorscheme()<CR>", { noremap = true } })
map({ "n", "<leader>rr", "<cmd>lua require('telescope.builtin').reloader()<CR>", { noremap = true } })

return M
