local map = require("config.utils").map
local au = require "au"

-- options

vim.g.nvim_tree_symlink_arrow = " -> "
vim.g.nvim_tree_icons = {
    folder = {
        arrow_closed = "",
        arrow_open = "",
    },
    git = {
        unstaged = "",
        staged = "",
        unmerged = "",
        renamed = "➜",
        untracked = "",
        deleted = "",
        ignored = "◌",
    },
}

require("nvim-tree").setup {
    update_focused_file = {
        enable = false,
    },
    git = {
        ignore = false,
    },
    open_on_setup = true,
    filters = {
        dotfiles = false,
        custom = { "^\\.DS_Store$", "^\\.git$" },
    },
    renderer = {
        indent_markers = {
            enable = true,
        },
    },
    view = {
        width = 30,
        mappings = {
            list = {
                { key = "d", cb = require("nvim-tree.config").nvim_tree_callback "trash" },
            },
        },
    },
    actions = {
        open_file = {
            resize_window = true,
        },
    },
}

map { "n", "<C-n>", ":NvimTreeToggle<CR>" }
map { "n", "<leader>r", ":NvimTreeRefresh<CR>" }

au.group("nvim_tree_conf", function(grp)
    grp.BufEnter = {
        "NvimTree",
        "setlocal cursorline",
        -- function()
        --     vim.wo.cursorline = true
        -- end,
    }
end)
