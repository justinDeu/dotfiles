return {
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- Language Servers
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',

            -- Snippets
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',

            -- LSP
            'neovim/nvim-lspconfig',
            'onsails/lspkind.nvim',
        },
        config = function()
            local lsp = require("lsp-zero")

            require('mason').setup({ PATH = "append" })
            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls' },
                handlers = {
                    lsp.default_setup,
                },
            })

            local cmp = require('cmp')
            local lspkind = require('lspkind')
            local lspconfig = require('lspconfig')
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            local cmp_action = lsp.cmp_action()
            require("luasnip.loaders.from_vscode").lazy_load()

            lspconfig.ruff_lsp.setup {
                on_attach = function(client, bufnr)
                    if client.name == 'ruff_lsp' then
                        -- Disable hover provider and rely on Jedi
                        client.server_capabilities.hoverProvider = false
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.code_action({
                                    context = { only = { "source.organizeImports" } },
                                    apply = true,
                                })
                                vim.wait(100)
                            end,
                        })
                    end
                end,
                init_options = {
                    settings = {
                        -- Any extra CLI arguments for `ruff` go here.
                        args = {},
                    }
                }
            }
            lspconfig.jedi_language_server.setup {}

            lspconfig.texlab.setup {
                settings = {
                    texlab = {
                        build = {
                            executable = "pdflatex",
                            onSave = true,
                        }
                    }
                }
            }

            cmp.setup({
                preselect = cmp.PreselectMode.None,
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                formatting = {
                    format = lspkind.cmp_format({ mode = "symbol_text" })
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ['<Tab>'] = cmp_action.tab_complete(),
                    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'luasnip' },
                    { name = 'nvim_lua' },
                    { name = 'lazydev', group_index = 0, },
                }),
                window = {
                    completion = cmp.config.window.bordered({ border = 'single' }),
                    documentation = cmp.config.window.bordered({ border = 'single' }),
                }
            })
            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                }),
                matching = { disallow_symbol_nonprefix_matching = false }
            })

            lsp.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }

                if client.name == "eslint" then
                    vim.cmd.LspStop('eslint')
                    return
                end

                vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
                vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
                vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
                    vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
                end, opts)
            end)

            lsp.format_on_save({
                format_opts = {
                    async = false,
                    timeout_ms = 10000,
                },
                servers = {
                    ['tsserver'] = { 'javascript', 'typescript' },
                    ['rust-analyzer'] = { 'rust' },
                    ['ruff_lsp'] = { 'python' },
                    ['lua_ls'] = { 'lua' },
                }
            })


            vim.diagnostic.config({
                virtual_text = true,
            })

            lsp.setup()
        end,
    }
}
