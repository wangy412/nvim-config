local cmp = require "cmp"
local luasnip = require "luasnip"
local lspkind = require "lspkind"

vim.o.completeopt = "menu,menuone,noselect"

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

cmp.setup {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },

    mapping = {
        ["<CR>"] = cmp.mapping.confirm { select = false },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "buffer" },
    }),
    formatting = {
        format = lspkind.cmp_format(),
    },
    experimental = {
        ghost_text = true,
    },
}

local function empty_format(_, vim_item)
    vim_item.menu = ""
    vim_item.kind = ""
    return vim_item
end

cmp.setup.cmdline("/", {
    completion = {
        keyword_length = 3,
    },
    formatting = {
        format = empty_format,
    },
    sources = {
        { name = "buffer" },
    },
})

cmp.setup.cmdline(":", {
    confirmation = {
        completeopt = "menu,menuone,insert",
    },
    completion = {
        keyword_length = 3,
    },
    formatting = {
        format = empty_format,
    },
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})
