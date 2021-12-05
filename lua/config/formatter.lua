local au = require "au"

---@generic T
---@generic U
---@param tbl T[]
---@param f fun(x: T): U
---@return U[]
local function map(tbl, f)
    local t = {}
    for k, v in pairs(tbl) do
        t[k] = f(v)
    end
    return t
end

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
        cwd = vim.fn.expand "%:p:h", -- run clang-format in cwd of current file
    }
end

local function ormolu()
    return {
        exe = "ormolu",
        args = { filename() },
        stdin = true,
    }
end

local function fourmolu()
    return {
        exe = "fourmolu",
        args = { filename() },
        stdin = true,
    }
end

local function stylish_haskell()
    return {
        exe = "stylish-haskell",
        args = { filename() },
        stdin = true,
    }
end

local function pandoc()
    return {
        exe = "pandoc",
        args = { filename(), "-t", "markdown", "-s" },
        stdin = true,
    }
end

local function elm_format()
    return {
        exe = "elm-format",
        args = { "--stdin" },
        stdin = true,
        cws = vim.fn.expand "%:p:h",
    }
end

local function swiftformat()
    return {
        exe = "swiftformat",
        args = {},
        stdin = true,
    }
end

local filetype = {
    javascript = { prettier },
    typescript = { prettier },
    html = { prettier },
    elm = { elm_format },
    scss = { prettier },
    css = { prettier },
    liquid = { prettier },
    lua = { stylua },
    c = { clangFormat },
    cpp = { clangFormat },
    haskell = { ormolu },
    swift = { swiftformat },
}

require("formatter").setup {
    filetype = filetype,
}

-- format on save
local format_on_save_extensions = {
    "hs",
    "scss",
    "css",
    "html",
    "elm",
    "js",
    "ts",
    "lua",
    "c",
    "cpp",
    "swift",
}

au.group("format_on_save", function(grp)
    grp.BufWritePost = {
        table.concat(
            map(format_on_save_extensions, function(x)
                return "*." .. x
            end),
            ","
        ),
        "FormatWrite",
    }
end)
