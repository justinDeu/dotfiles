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

            lsp.preset("recommended")

            require('mason').setup({PATH="append"})
            require('mason-lspconfig').setup({
              ensure_installed = {'lua_ls'},
              handlers = {
                lsp.default_setup,
              },
            })

            local cmp = require('cmp')
            local lspkind = require('lspkind')
            local lspconfig = require('lspconfig')
            local cmp_select = {behavior = cmp.SelectBehavior.Select}
            local cmp_action = lsp.cmp_action()

            lspconfig.pylsp.setup{
              settings = {
                pylsp = {
                  plugins = {
                    pycodestyle = {
                      maxLineLength = 120
                    },
                    ruff = {
                      enabled = true,  -- Enable the plugin
                      formatEnabled = true,  -- Enable formatting using ruffs formatter
                      extendSelect = { "I" },  -- Rules that are additionally used by ruff
                      extendIgnore = { "C90" },  -- Rules that are additionally ignored by ruff
                      format = { "I" },  -- Rules that are marked as fixable by ruff that should be fixed when running textDocument/formatting
                      severities = { ["D212"] = "I" },  -- Optional table of rules where a custom severity is desired
                      unsafeFixes = false,  -- Whether or not to offer unsafe fixes as code actions. Ignored with the "Fix All" action

                      -- Rules that are ignored when a pyproject.toml or ruff.toml is present:
                      lineLength = 120,  -- Line length to pass to ruff checking and formatting
                      select = { "F" },  -- Rules to be enabled by ruff
                      ignore = { "D210" },  -- Rules to be ignored by ruff
                      perFileIgnores = { ["__init__.py"] = "CPY001" },  -- Rules that should be ignored for specific files
                      targetVersion = "py310",  -- The minimum python version to target (applies for both linting and formatting).
                    },
                  }
                }
              }
            }

            lspconfig.texlab.setup{
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
               snippet = {
                 expand = function(args)
                   require("luasnip").lsp_expand(args.body)
                 end,
               },
               formatting = {
                   format = lspkind.cmp_format({mode="symbol_text"})
               },
               mapping = cmp.mapping.preset.insert({
                  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                  ['<C-f>'] = cmp.mapping.scroll_docs(4),
                  ['<C-Space>'] = cmp.mapping.complete(),
                  ['<C-e>'] = cmp.mapping.abort(),
                  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                  ['<Tab>'] = cmp_action.tab_complete(),
                  ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
                }),
                sources = cmp.config.sources({
                    {name = 'nvim_lsp'},
                    {name = 'buffer'},
                    {name = 'path'},
                    {name = 'luasnip'},
                    {name = 'nvim_lua'},

                }),
                window = {
                    completion = cmp.config.window.bordered({border='single'}),
                    documentation = cmp.config.window.bordered({border='single'}),
                }
            })

            lsp.set_preferences({
                suggest_lsp_servers = false,
                sign_icons = {
                    error = 'E',
                    warn = 'W',
                    hint = 'H',
                    info = 'I'
                }
            })

            lsp.on_attach(function(client, bufnr)
              local opts = {buffer = bufnr, remap = false}

              if client.name == "eslint" then
                  vim.cmd.LspStop('eslint')
                  return
              end

              vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
              vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
              vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
              vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
              vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
              vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
              vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
              vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
              vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
              vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
              vim.keymap.set({'n', 'x'}, '<leader>f', function()
                vim.lsp.buf.format({async = false, timeout_ms = 10000})
              end, opts)
            end)

            lsp.format_on_save({
              format_opts = {
                async = false,
                timeout_ms = 10000,
              },
              servers = {
                ['tsserver'] = {'javascript', 'typescript'},
                ['rust-analyzer'] = {'rust'},
                ['ruff_lsp'] = {'python'},
              }
            })

            lsp.setup()

            vim.diagnostic.config({
                virtual_text = true,
            })

        end,
    }
}
