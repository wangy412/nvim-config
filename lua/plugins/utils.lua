local M = {}

--[ My own ]--

-- TODO: Change to just use arguments
--- Convenience for vim.api.nvim_set_keymap
--- Usage:
---   map { "n", "jk", "<esc>", { expr = true } }
--- passes noremap = true automatically
function M.map(tbl)
	local opts
	if #tbl == 4 then
		opts = tbl[4]
	else
		opts = { noremap = true }
	end

	vim.api.nvim_set_keymap(tbl[1], tbl[2], tbl[3], opts)
end

--- Check if a list contains an element
function M.contains(list, x)
	for _, v in ipairs(list) do
		if v == x then
			return true
		end
	end
	return false
end

--[ https://github.com/disrupted/dotfiles/blob/6d720d18712e9c4313f8c155ec8bf12bd466a49e/.config/nvim/lua/conf/utils.lua ]--

--- Check whether the current buffer is empty
function M.is_buffer_empty()
	return vim.fn.empty(vim.fn.expand("%:t")) == 1
end

--- Check if the windows width is greater than a given number of columns
function M.has_width_gt(cols)
	return vim.fn.winwidth(0) / 2 > cols
end

--[ https://github.com/kraftwerk28/dotfiles/blob/cd206274e42273ad051471a8c1e34633c12eb076/.config/nvim/lua/utils.lua#L122 ]--
function M.highlight(cfg)
	local command = "highlight"
	if cfg.bang == true then
		command = command .. "!"
	end
	if #cfg == 2 and type(cfg[1]) == "string" and type(cfg[2]) == "string" then
		-- :highlight link
		command = command .. " link " .. cfg[1] .. " " .. cfg[2]
		vim.cmd(command)
		return
	end
	local guifg = cfg.fg or cfg.guifg or cfg[2]
	local guibg = cfg.bg or cfg.guibg or cfg[3]
	local gui = cfg.gui or cfg[4]
	local guisp = cfg.guisp or cfg[5]
	if type(cfg.override) == "string" then
		local existing = vim.api.nvim_get_hl_by_name(cfg.override, true)
		if existing.foreground ~= nil then
			guifg = sprintf("#%x", existing.foreground)
		end
		if existing.background ~= nil then
			guibg = sprintf("#%x", existing.background)
		end
		if existing.special ~= nil then
			guibg = sprintf("#%x", existing.background)
		end
		if existing.undercurl == true then
			gui = "undercurl"
		elseif existing.underline == true then
			gui = "underline"
		end
	end
	command = command .. " " .. cfg[1]
	if guifg ~= nil then
		command = command .. " guifg=" .. guifg
	end
	if guibg ~= nil then
		command = command .. " guibg=" .. guibg
	end
	if gui ~= nil then
		command = command .. " gui=" .. gui
	end
	if guisp ~= nil then
		command = command .. " guisp=" .. guisp
	end
	vim.cmd(command)
end

return M
