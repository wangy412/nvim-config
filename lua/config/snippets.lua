local ls = require("luasnip")
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
	return t({ "", "" })
end

-- stylua: ignore start
ls.snippets = {
    cpp = {
        s("iofile", {
            t([[ifstream cin("]]), i(1), t([[in.txt");]]),
            newline(),
            t([[ofstream cout("]]), f(copy, 1), t([[out.txt");]]),
        }),
        s("fastio", {
            t({
                "cin.tie(0);",
                "cout.tie(0);",
                "ios_base::sync_with_stdio(0);",
            })
        }),
    }
}
-- stylua: ignore end
