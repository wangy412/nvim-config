vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_no_default_key_mappings = 1
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g.vim_markdown_fenced_languages = { "js=javascript", "ts=typescript", "cpp=cpp" }
vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_new_list_item_indent = 0

-- vim-table-mode
vim.g.table_mode_corner_corner = "|"
vim.g.table_mode_header_fillchar = "-"

-- vim-pandoc
vim.g["pandoc#modules#disabled"] = { "folding" }

vim.cmd([[
augroup markdown_stuff
    autocmd!
    autocmd FileType pandoc set nowrap
    autocmd FileType pandoc nnoremap <leader>tt :TableModeToggle<CR>
augroup END
]])
