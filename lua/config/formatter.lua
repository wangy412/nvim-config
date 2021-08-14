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

local filetype = {
	javascript = { prettier },
	typescript = { prettier },
	markdown = { prettier },
	scss = { prettier },
	liquid = { prettier },
	lua = { stylua },
	c = { clangFormat },
	cpp = { clangFormat },
}

require("formatter").setup({
	filetype = filetype,
})

-- format on save
vim.api.nvim_exec(
	[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *scss,*.js,*.ts,*.md,*lua,*.c,*.cpp FormatWrite
augroup END
]],
	true
)
