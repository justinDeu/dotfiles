return {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false, -- This plugin is already lazy
  config = function()
        vim.g.rustaceanvim = function()
          local rustacean_opts = {
            tools = {
              executor = 'termopen',
            },
            server = {
              --on_attach = function(...)
                --require('mrcjk.lsp').on_dap_attach(...)
              --end,
              default_settings = {
                ['rust-analyzer'] = {
                  cargo = {
                    allFeatures = true,
                    loadOutDirsFromCheck = true,
                    runBuildScripts = true,
                  },
                  procMacro = {
                    enable = true,
                    ignored = {
                      ['async-trait'] = { 'async_trait' },
                      ['napi-derive'] = { 'napi' },
                      ['async-recursion'] = { 'async_recursion' },
                    },
                  },
                  inlayHints = {
                    lifetimeElisionHints = {
                      enable = true,
                      useParameterNames = true,
                    },
                  },
                },
              },
            },
          }
          return rustacean_opts
        end
  end
}
