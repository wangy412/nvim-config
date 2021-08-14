local utils = require("config.utils")

-- nvim-ts-context-commentstring
require("nvim-treesitter.configs").setup({
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})

local languages = { "vue", "html" }
for _, lang in ipairs(languages) do
	require("kommentary.config").configure_language(lang, {
		single_line_comment_string = "auto",
		multi_line_comment_strings = "auto",
		hook_function = function()
			require("ts_context_commentstring.internal").update_commentstring()
		end,
	})
end

-- kommentary
vim.g.kommentary_create_default_mappings = false
utils.map({ "n", "<leader>,", "<Plug>kommentary_line_default", {} })
utils.map({ "x", "<leader>,", "<Plug>kommentary_visual_default<esc>", {} })

require("kommentary.config").configure_language("default", {
	use_consistent_indentation = true,
	prefer_single_line_comments = true,
})
