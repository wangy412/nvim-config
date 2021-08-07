-- vim:foldmethod=marker

local gl = require("galaxyline")
local utils = require("plugins.utils")
local condition = require("galaxyline.condition")
local diagnostic = require("galaxyline.provider_diagnostic")

local gls = gl.section

gl.short_line_list = { "packer", "NvimTree", "Outline", "LspTrouble", "TelescopePrompt" }

-- {{{ Colors
local colors = {
	bg = "NONE",
	fg = "#abb2bf",
	section_bg = "#38393f",
	--inactive_bg = '#282c34',
	inactive_bg = "#191c21",
	blue = "#61afef",
	green = "#98c379",
	purple = "#c678dd",
	orange = "#f29718",
	red = "#e06c75",
	yellow = "#e5c07b",
	darkgrey = "#2c323d",
	middlegrey = "#8791A5",
}
-- }}}

-- {{{ Seperators
local currentSepStyle = "angled"
local seps = {
	round = {
		left = "",
		right = "",
		left_thin = "",
		right_thin = "",
	},
	angled = {
		left = "",
		right = "",
		left_thin = "",
		right_thin = "",
	},
	slanted = {
		left = "",
		right = "",
		left_thin = "",
		right_thin = "",
	},
}
local function getLeftSep()
	return seps[currentSepStyle].left
end
local function getRightSep()
	return seps[currentSepStyle].right
end
local function getLeftThinSep()
	return seps[currentSepStyle].left_thin
end
local function getRightThinSep()
	return seps[currentSepStyle].right_thin
end
-- }}}

-- {{{ Local helper functions
local buffer_not_empty = function()
	return not utils.is_buffer_empty()
end

local checkwidth = function()
	return utils.has_width_gt(35) and buffer_not_empty()
end

local is_file = function()
	return vim.bo.buftype ~= "nofile"
end

local function has_value(tab, val)
	for _, value in ipairs(tab) do
		if value[1] == val then
			return true
		end
	end
	return alse
end

local mode_color = function()
	local mode_colors = {
		[110] = colors.green,
		[105] = colors.blue,
		[99] = colors.green,
		[116] = colors.blue,
		[118] = colors.purple,
		[22] = colors.purple,
		[86] = colors.purple,
		[82] = colors.red,
		[115] = colors.red,
		[83] = colors.red,
	}

	local color = mode_colors[vim.fn.mode():byte()]
	if color ~= nil then
		return color
	else
		return colors.purple
	end
end

local function file_readonly()
	if vim.bo.filetype == "help" then
		return ""
	end
	if vim.bo.readonly == true then
		return "  "
	end
	return ""
end

local function get_current_file_name()
	local file = vim.fn.expand("%:t")
	if vim.fn.empty(file) == 1 then
		return ""
	end
	if string.len(file_readonly()) ~= 0 then
		return file .. file_readonly()
	end
	if vim.bo.modifiable then
		if vim.bo.modified then
			return file .. "  "
		end
	end
	return file .. " "
end

local function split(str, sep)
	local res = {}
	local n = 1
	for w in str:gmatch("([^" .. sep .. "]*)") do
		res[n] = res[n] or w -- only set once (so the blank after a string is ignored)
		if w == "" then
			n = n + 1
		end -- step forwards on a blank but not a string
	end
	return res
end

local function get_basename(file)
	return file:match("^.+/(.+)$")
end

local GetGitRoot = function()
	local git_dir = require("galaxyline.provider_vcs").get_git_dir()
	if not git_dir then
		return ""
	end

	local git_root = git_dir:gsub("/.git/?$", "")
	return get_basename(git_root)
end

local LspStatus = function()
	if #vim.lsp.get_active_clients() > 0 then
		return require("lsp-status").status()
	end
	return ""
end

local LspCheckDiagnostics = function()
	if
		#vim.lsp.get_active_clients() > 0
		and diagnostic.get_diagnostic_error() == nil
		and diagnostic.get_diagnostic_warn() == nil
		and diagnostic.get_diagnostic_info() == nil
		and require("lsp-status").status() == " "
	then
		return " "
	end
	return ""
end
-- }}}

-- {{{ Left side

gls.left[#gls.left + 1] = {
	ViMode = {
		provider = function()
			local aliases = {
				[110] = "NORMAL",
				[105] = "INSERT",
				[99] = "COMMAND",
				[116] = "TERMINAL",
				[118] = "VISUAL",
				[22] = "V-BLOCK",
				[86] = "V-LINE",
				[82] = "REPLACE",
				[115] = "SELECT",
				[83] = "S-LINE",
			}

			utils.highlight({ "GalaxyViMode", nil, mode_color(), "bold" })
			utils.highlight({
				"ViModeSeparator",
				mode_color(),
				(is_file() and colors.section_bg or colors.bg),
			})

			local alias = aliases[vim.fn.mode():byte()]
			local mode
			if alias ~= nil then
				if utils.has_width_gt(35) then
					mode = alias
				else
					mode = alias:sub(1, 1)
				end
			else
				mode = vim.fn.mode():byte()
			end
			return "  " .. mode .. " "
		end,
		separator = getLeftSep(),
		-- separator_highlight = { colors.section_bg, colors.section_bg },
		-- TODO: Figure out how to use a different background
		--       depending on whether the next section is shown
		highlight = { colors.darkgrey, colors.bg, "bold" },
	},
}
gls.left[#gls.left + 1] = {
	FileIcon = {
		provider = {
			function()
				return " "
			end,
			"FileIcon",
		},
		condition = buffer_not_empty,
		highlight = {
			require("galaxyline.provider_fileinfo").get_file_icon_color,
			colors.section_bg,
		},
	},
}
gls.left[#gls.left + 1] = {
	FilePath = {
		provider = function()
			local fp = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h")
			local tbl = split(fp, "/")
			local len = #tbl

			if len > 2 and not len == 3 and not tbl[0] == "~" then
				return "…/" .. table.concat(tbl, "/", len - 1) .. "/" -- shorten filepath to last 2 folders
				-- alternative: only 1 containing folder using vim builtin function
				-- return '…/' .. vim.fn.fnamemodify(vim.fn.expand '%', ':p:h:t') .. '/'
			else
				return fp .. "/"
			end
		end,
		condition = function()
			return is_file() and checkwidth()
		end,
		highlight = { colors.middlegrey, colors.section_bg },
	},
}
gls.left[#gls.left + 1] = {
	FileName = {
		provider = get_current_file_name,
		condition = buffer_not_empty,
		highlight = { colors.fg, colors.section_bg },
		separator_highlight = { colors.section_bg, colors.bg },
		separator = getLeftSep(),
	},
}
gls.left[#gls.left + 1] = {
	DiagnosticError = {
		provider = { "DiagnosticError" },
		icon = "  ",
		highlight = { colors.red, colors.bg },
	},
}
gls.left[#gls.left + 1] = {
	DiagnosticWarn = {
		provider = { "DiagnosticWarn" },
		icon = "  ",
		highlight = { colors.orange, colors.bg },
	},
}
gls.left[#gls.left + 1] = {
	DiagnosticInfo = {
		provider = { "DiagnosticInfo" },
		icon = "  ",
		highlight = { colors.blue, colors.bg },
	},
}
-- }}}

-- {{{ Middle
gls.mid[#gls.mid + 1] = {
	ShowLspClient = {
		provider = "GetLspClient",
		condition = function()
			local tbl = { ["dashboard"] = true, [""] = true }
			if tbl[vim.bo.filetype] then
				return false
			end
			return true
		end,
		icon = "  ",
		highlight = { colors.middlegrey, colors.bg },
		separator = "",
		separator_highlight = { colors.bg, colors.bg },
	},
}

-- }}}

-- {{{ Right side
gls.right[#gls.right + 1] = {
	DiffAdd = {
		provider = "DiffAdd",
		condition = checkwidth,
		icon = "+",
		highlight = { colors.green, colors.bg },
		separator = " ",
		separator_highlight = { colors.section_bg, colors.bg },
	},
}
gls.right[#gls.right + 1] = {
	DiffModified = {
		provider = "DiffModified",
		condition = checkwidth,
		icon = "~",
		highlight = { colors.blue, colors.bg },
	},
}
gls.right[#gls.right + 1] = {
	DiffRemove = {
		provider = "DiffRemove",
		condition = checkwidth,
		icon = "-",
		highlight = { colors.red, colors.bg },
	},
}
gls.right[#gls.right + 1] = {
	Space = {
		provider = function()
			return " "
		end,
		highlight = { colors.section_bg, colors.bg },
	},
}
gls.right[#gls.right + 1] = {
	GitBranch = {
		provider = { "GitBranch" },
		icon = "  ",
		separator = " " .. getRightSep(),
		separator_highlight = { colors.section_bg, colors.secion_bg },
		condition = condition.check_git_workspace,
		highlight = { colors.red, colors.section_bg },
	},
}
local function gitRootCondition()
	return utils.has_width_gt(50) and condition.check_git_workspace()
end
gls.right[#gls.right + 1] = {
	GitRoot = {
		provider = { GetGitRoot },
		condition = gitRootCondition,
		icon = "  ",
		highlight = { colors.blue, colors.section_bg },
		separator = " " .. getRightThinSep(),
		separator_highlight = { colors.blue, colors.section_bg },
	},
}
gls.right[#gls.right + 1] = {
	PerCent = {
		provider = { "LinePercent" },
		-- separator = ' ',
		separator = " " .. getRightSep(),
		separator_highlight = { colors.blue, gitRootCondition() and colors.section_bg or colors.bg },
		highlight = { colors.darkgrey, colors.blue },
	},
}
gls.right[#gls.right + 1] = {
	LineNumber = {
		provider = function()
			local line = vim.fn.line(".")
			local col = vim.fn.col(".")
			local total = vim.fn.line("$")
			return string.format("%d/%d :%d ", line, total, col)
		end,
		icon = "  ",
		-- separator = ' ',
		-- separator_highlight = { colors.blue, colors.blue },
		highlight = { colors.darkgrey, colors.blue },
	},
}
-- gls.right[#gls.right + 1] = {
--     ColumnNumber = {
--         provider = function()
--             return string.format(":%d ", vim.fn.col('.'))
--         end,
--         separator = ' ',
--         separator_highlight = { colors.blue, colors.blue },
--         icon = '  ',
--         highlight = { colors.darkgrey, colors.blue }
--     }
-- }
-- }}}

-- {{{ Short status line
gls.short_line_left[#gls.short_line_left + 1] = {
	ShortFileIcon = {
		provider = {
			function()
				return "  "
			end,
			"FileIcon",
		},
		condition = buffer_not_empty,
		highlight = {
			require("galaxyline.provider_fileinfo").get_file_icon_color,
			colors.section_bg,
		},
	},
}
gls.short_line_left[#gls.short_line_left + 1] = {
	ShortFileName = {
		provider = get_current_file_name,
		condition = buffer_not_empty,
		highlight = { colors.fg, colors.section_bg },
		separator = getLeftSep() .. " ",
		separator_highlight = { colors.section_bg, colors.inactive_bg },
	},
}

gls.short_line_right[#gls.short_line_right + 1] = {
	ShortPerCent = {
		provider = { "LinePercent" },
		separator = " " .. getRightSep(),
		separator_highlight = { colors.blue, colors.inactive_bg },
		highlight = { colors.darkgrey, colors.blue },
	},
}
-- }}}
