local utils = require("plugins.utils")

vim.o.completeopt = "menuone,noselect"

require("compe").setup({
	enabled = true,
	autocomplete = true,
	debug = false,
	min_length = 1,
	preselect = "enable",
	throttle_time = 80,
	source_timeout = 200,
	resolve_timeout = 800,
	incomplete_delay = 400,
	max_abbr_width = 100,
	max_kind_width = 100,
	max_menu_width = 100,
	documentation = {
		border = { "", "", "", " ", "", "", "", " " }, -- the border option is the same as `|help nvim_open_win|`
		winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
		max_width = 120,
		min_width = 60,
		max_height = math.floor(vim.o.lines * 0.3),
		min_height = 1,
	},

	source = {
		path = true,
		buffer = true,
		calc = true,
		nvim_lsp = true,
		nvim_lua = true,
		ultisnips = true,
		luasnip = true,
	},
})

-- Mappings
local set_keymap_opts = { silent = true, expr = true, noremap = true }
utils.map({ "i", "<C-Space>", "compe#complete()", set_keymap_opts })
utils.map({ "i", "<CR>", "compe#confirm('<CR>')", set_keymap_opts })
utils.map({ "i", "<C-e>", "compe#close('<C-e>')", set_keymap_opts })
-- utils.map { "n", "<C-n>",     "compe#scroll({ 'delta': +4 })", set_keymap_opts }
-- utils.map { "n", "<C-p>",     "compe#scroll({ 'delta': -4 })", set_keymap_opts }

-- Use tabs
-- https://github.com/hrsh7th/nvim-compe#how-to-use-tab-to-navigate-completion-menu
local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-n>")
	elseif require("luasnip").expand_or_jumpable() then
		return t("<cmd>lua require('luasnip').jump(1)<CR>")
	elseif check_back_space() then
		return t("<Tab>")
	else
		return vim.fn["compe#complete"]()
	end
end
_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-p>")
	elseif require("luasnip").jumpable(-1) then
		return t("<cmd>lua require'luasnip'.jump(-1)<CR>")
	else
		-- If <S-Tab> is not working in your terminal, change it to <C-h>
		return t("<S-Tab>")
	end
end

utils.map({ "i", "<Tab>", "v:lua.tab_complete()", { expr = true } })
utils.map({ "s", "<Tab>", "v:lua.tab_complete()", { expr = true } })
utils.map({ "i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true } })
utils.map({ "s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true } })
