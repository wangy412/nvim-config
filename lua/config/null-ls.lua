local null_ls = require "null-ls"

null_ls.setup {
    sources = {
        null_ls.builtins.code_actions.gitsigns,
        -- null_ls.builtins.code_actions.eslint_d,

        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.mypy,
        -- null_ls.builtins.diagnostics.eslint_d,
        -- null_ls.builtins.diagnostics.eslint,

        -- null_ls.builtins.formatting.eslint_d.with {
        --     disabled_filetypes = { "markdown", "pandoc" },
        -- },
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        -- null_ls.builtins.formatting.fourmolu,
        null_ls.builtins.formatting.clang_format.with {
            filetypes = { "c" },
        },
    },
    on_attach = require("config.lspconfig").on_attach,
}
