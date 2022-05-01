-- vim:foldmethod=marker

local nvim_lsp = require "lspconfig"
local au = require "au"

local M = {}

-- {{{ On attach
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- TODO: come up with a system for default formatters for certian filetypes
    if vim.api.nvim_buf_get_option(bufnr, "filetype") == "vue" and client.name == "null-ls" then
        client.resolved_capabilities.document_formatting = false
    end

    if client.resolved_capabilities.document_formatting then
        vim.cmd [[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync(nil, nil, {"null-ls"})
            augroup END
            ]]
    end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    -- buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    -- buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    -- buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "<space>[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "<space>]", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<space>ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end
-- }}}

-- {{{ Default config

-- stylua: ignore start
nvim_lsp.util.default_config = vim.tbl_extend("force",
    nvim_lsp.util.default_config,
    {
        handlers = {
            ["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                    update_in_insert = true,
                    -- virtual_text = false,
                }
            ),
        },
    }
)
-- stylua: ignore end

-- show the diagnostics in a popup
au.group("lspconfig", function(grp)
    grp.CursorHold = function()
        vim.diagnostic.open_float { focusable = false }
    end
    grp.CursorHoldI = "silent! lua vim.diagnostic.open_float { focusable = false }"
end)

-- }}}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities.offsetEncoding = { "utf-16" } -- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428

-- {{{ LSPs without special config
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "jedi_language_server", "hls", "clangd", "bashls", "elmls", "rust_analyzer" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        capabilities = capabilities,
        on_attach = M.on_attach,
        flags = {
            debounce_text_changes = 150,
        },
    }
end
-- }}}

-- {{{ Json
nvim_lsp.jsonls.setup {
    capabilities = capabilities,
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
        },
    },
}
-- }}}

-- {{{ Web: html, typescript, javascript, vue, eslint

-- html
nvim_lsp.html.setup {
    capabilities = capabilities,
    on_attach = M.on_attach,
}

-- css/scss
nvim_lsp.cssls.setup {
    capabilities = capabilities,
    on_attach = M.on_attach,
}

-- typescript
nvim_lsp.tsserver.setup {
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        M.on_attach(client, bufnr)
    end,
    flags = {
        debounce_text_changes = 150,
    },
}

-- linter is set up with null-ls

-- vue
nvim_lsp.vuels.setup {
    -- https://github.com/ngtinsmith/dotfiles/blob/b78bf3115d746d037c814ce6767b4c6ba38021c5/.vimrc#L559
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = true
        M.on_attach(client, bufnr)
    end,
    init_options = {
        config = {
            vetur = {
                completion = {
                    autoImport = true,
                    useScaffoldSnippets = true,
                },
                format = {
                    defaultFormatter = {
                        js = "prettier",
                        ts = "prettier",
                        css = "prettier",
                        html = "prettier",
                    },
                },
            },
        },
    },
    flags = {
        debounce_text_changes = 150,
    },
}
-- vue autoformat
au.group("VueFmt", function(grp)
    grp.BufWritePre = {
        "*.vue",
        function()
            vim.lsp.buf.formatting_sync(nil, 1000)
        end,
    }
end)
-- }}}

-- {{{ Lua
local system_name = "macOS"
local sumneko_root_path = "/Users/yunze/Documents/Coding/other-ppl/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- TODO: Make this project-specific
-- Make the server aware of Neovim runtime files
local workspace_library = vim.api.nvim_get_runtime_file("", true)
-- And also hammerspoon
-- (oof this doesn't work)
-- table.insert(workspace_library, "/Applications/Hammerspoon.app/Contents/Resources/extensions/hs")

require("lspconfig").sumneko_lua.setup {
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
    on_attach = M.on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                globals = { "vim", "hs" }, -- vim and hammerspoon globals
            },
            workspace = {
                library = workspace_library,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

-- }}}

-- {{{ Icons
local lsp_signs = {
    LspDiagnosticsSignHint = {
        text = "■",
        texthl = "LspDiagnosticsSignHint",
    },
    LspDiagnosticsSignInformation = {
        text = "■",
        texthl = "LspDiagnosticsSignInformation",
    },
    LspDiagnosticsSignWarning = {
        text = "▲",
        texthl = "LspDiagnosticsSignWarning",
    },
    LspDiagnosticsSignError = {
        text = "●",
        texthl = "LspDiagnosticsSignError",
    },
}

for hl_group, config in pairs(lsp_signs) do
    vim.fn.sign_define(hl_group, config)
end

-- }}}

return M
