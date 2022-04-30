local au = require "au"

-- NOTE: The naming of this file is a bit misleading beacuse
-- i decided to ditch the vim-markdown plugin and use vim-pandoc instead

-- vim.g.vim_markdown_folding_disabled = 1
-- vim.g.vim_markdown_no_default_key_mappings = 1
-- vim.g.vim_markdown_conceal = 0
-- vim.g.vim_markdown_conceal_code_blocks = 0
-- vim.g.vim_markdown_fenced_languages = { "js=javascript", "ts=typescript", "cpp=cpp" }
-- vim.g.vim_markdown_frontmatter = 1
-- vim.g.vim_markdown_new_list_item_indent = 0

-- vim-table-mode
vim.g.table_mode_corner_corner = "|"
vim.g.table_mode_header_fillchar = "-"

-- vim-pandoc
vim.g["pandoc#modules#disabled"] = { "formatting", "completion", "folding" }
vim.g["pandoc#syntax#codeblocks#embeds#langs"] = { "c", "cpp", "js=javascript", "ts=typescript", "haskell=haskell" }
vim.g["pandoc#syntax#conceal#blacklist"] = { "definition" }
vim.g["pandoc#syntax#style#use_definition_lists"] = 0

-- vim.cmd [[
-- augroup markdown_stuff
--     autocmd!
--     autocmd FileType pandoc set nowrap
--     autocmd FileType pandoc nnoremap <leader>tt :TableModeToggle<CR>
-- augroup END
-- ]]

au.group("markdown_stuff", function(grp)
    grp.FileType = {
        "markdown",
        function()
            vim.wo.colorcolumn = "81"
        end,
    }
    grp.FileType = { "pandoc", "set nowrap" }
    grp.FileType = { "pandoc", "nnoremap <leader>tt :TableModeToggle<CR>" }
end)
