require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		-- disable = { "vim", "netrw" },
	},
})

require("nvim-treesitter.install").compilers = { "gcc-11" }

-- local parser_config = require ("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.haskell = {
--     install_info = {
--         url = "~/Documents/Coding/Other Ppl/tree-sitter-haskell",
--         files = { "src/parser.c" },
--     },
--     filetype = "hs",
-- }
