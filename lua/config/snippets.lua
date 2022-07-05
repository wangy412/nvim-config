local ls = require "luasnip"

-- luasnip setup
ls.config.set_config {
    history = false,
    delete_check_events = "InsertLeave",
    region_check_events = "CursorHold",
}

-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda

-- Helpers
local function copy(args)
    return args[1]
end

local function newline()
    return t { "", "" }
end

-- stylua: ignore start
-- todo: use luasnip.extras.fmt
ls.snippets = {
    cpp = {
        s({ trig = "iofile", dscr = "Set I/O file for cin and cout" }, {
            t [[ifstream cin("]] , i(1), t [[in.txt");]] ,
            newline(),
            t [[ofstream cout("]] , f(copy, 1), t [[out.txt");]] ,
            i(0),
        }),
    },
    haskell = {
        s({ trig = "lang", dscr = "Language extension pragma" }, {
            t "{-# LANGUAGE ", i(1), t " #-}",
            i(0),
        }),
        s({ trig = "stscript", dscr = "Shebang for stack scripts" }, {
            t "#!/usr/bin/env stack",
            newline(),
            t "-- stack --resolver", i(1, "nightly-2021-12-04"), t "script",
            i(0),
        }),
        s({ trig = "main", dscr = "Main module" }, {
            t { "module Main where",
                "",
                "",
                "main :: IO ()",
                "main = do",
                "\t"},
            i(0)
        }),
    },
    typescript = {
        s({ trig = "jsdoc", dscr = "JSDoc comment" }, {
            t "/**",
            newline(),
            t " * ", i(0),
            newline(),
            t " */",
        }),
    }
}
