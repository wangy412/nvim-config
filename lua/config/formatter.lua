local augroup = require("nvim-lua-autocmd").augroup

local function filename()
	return '"' .. vim.api.nvim_buf_get_name(0) .. '"'
end

local function prettier()
	return {
		exe = "prettier",
		args = { "--stdin-filepath", filename(), "--prose-wrap", "always" },
		stdin = true,
	}
end

local function stylua()
	return {
		exe = "stylua",
		args = { "-" },
		stdin = true,
	}
end

local function clangFormat()
	return {
		exe = "clang-format",
		args = {},
		stdin = true,
		cwd = vim.fn.expand("%:p:h"), -- run clang-format in cwd of current file
	}
end

local function ormolu()
	return {
		exe = "ormolu",
		args = { filename() },
		stdin = true,
	}
end

local filetype = {
	javascript = { prettier },
	typescript = { prettier },
	html = { prettier },
	markdown = { prettier },
	scss = { prettier },
	liquid = { prettier },
	lua = { stylua },
	c = { clangFormat },
	cpp = { clangFormat },
	haskell = { ormolu },
}

require("formatter").setup({
	filetype = filetype,
})

-- format on save
local format_on_save_extensions = {
	"hs",
	"scss",
	"html",
	"js",
	"ts",
	"md",
	"lua",
	"c",
	"cpp",
}
augroup("format_on_save", function(a)
	a:autocmd("BufWritePost", function(c)
		c:listExt(format_on_save_extensions)
		c:exe("FormatWrite")
	end)
end)
