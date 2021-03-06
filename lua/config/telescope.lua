local map = require("config.utils").map

local M = {}

require("telescope").setup {
    pickers = {
        lsp_code_actions = {
            theme = "cursor",
        },
        spell_suggest = {
            theme = "cursor",
        },
    },
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = require("telescope.actions").close,
                ["<M-BS>"] = false,
                ["<C-Down>"] = require("telescope.actions").cycle_history_next,
                ["<C-Up>"] = require("telescope.actions").cycle_history_prev,
            },
        },
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
        -- file_sorter = sorters.get_fuzzy_file,
        file_ignore_patterns = {
            "node_modules/",
            "dist/",
            "main%.dSYM/",
            "%.git/",
            "%.DS_Store",
        },
        -- generic_sorter = sorters.get_generic_fuzzy_sorter,
        -- path_display = {"shorten"},
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    },
}

require("telescope").load_extension "fzy_native"

-- Key Mappings
-- stylua: ignore start
map({ "n", "<C-p>",      "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>"            })
map({ "n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>"             })

map({ "n", "<C-t>",      "<cmd>lua require('telescope.builtin').treesitter()<CR>"            })
map({ "n", "z=",         "<cmd>lua require('telescope.builtin').spell_suggest()<CR>"         })

map({ "n", "<leader>fd", "<cmd>lua require('telescope.builtin').diagnostics()<CR>"           })

map({ "n", "<leader>bb", "<cmd>lua require('telescope.builtin').builtin()<CR>"               })

map({ "n", "<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<CR>"          })
map({ "n", "<leader>gc", "<cmd>lua require('telescope.builtin').git_commits()<CR>"           })

map({ "n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>"               })
map({ "n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>"             })
map({ "n", "<leader>fc", "<cmd>lua require('telescope.builtin').commands<CR>"                })

map({ "n", "<leader>ch", "<cmd>lua require('telescope.builtin').command_history()<CR>"       })
map({ "n", "<leader>sh", "<cmd>lua require('telescope.builtin').search_history()<CR>"        })

map({ "n", "<leader>fs", "<cmd>lua require('telescope.builtin').symbols()<CR>"               })

map({ "n", "<leader>cs", "<cmd>lua require('telescope.builtin').colorscheme()<CR>"           })
map({ "n", "<leader>rr", "<cmd>lua require('telescope.builtin').reloader()<CR>"              })
-- stylua: ignore end

return M
