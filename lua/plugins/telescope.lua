local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local themes = require("telescope.themes")
local map = require("plugins.utils").map

local M = {}

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
			"main.dSYM",
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
-- stylua: ignore start
map({ "n", "<C-p>",      "<cmd>lua require('telescope.bulitin').find_files()<CR>" })
map({ "n", "<C-t>",      "<cmd>lua require('telescope.builtin').treesitter()<CR>"            })
map({ "n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>"             })
map({ "n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>"               })
map({ "n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>"             })
map({ "n", "<leader>fc", "<cmd>lua require('telescope.builtin').commands<CR>"                })
map({ "n", "<leader>ch", "<cmd>lua require('telescope.builtin').command_history()<CR>"       })
map({ "n", "<leader>cs", "<cmd>lua require('telescope.builtin').colorscheme()<CR>"           })
map({ "n", "<leader>rr", "<cmd>lua require('telescope.builtin').reloader()<CR>"              })
-- stylua: ignore end

-- Find files but no binary files
-- function M.find_non_binary_files()
-- 	require("telescope.builtin").find_files({
-- 		-- this is kind of a hack, because rg ignores binary files, but not with the --files option
-- 		-- so I'm basically saying give me all the files that aren't matched
-- 		-- along with an impossible regex (https://stackoverflow.com/a/2302992/13181476)

-- 		-- TODO: this unfortunately has the side effect of adding a "./" to the start of every entry.
-- 		-- it somehow doesn't work when i don't pass the last "." option to it.
-- 		find_command = { "rg", "--files-without-match", "^\b$", "." },
-- 	})
-- end

return M
