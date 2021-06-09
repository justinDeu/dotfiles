-- npm i -g pyright
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
--
-- pyright nil value for some reason
require'lspconfig'.pyright.setup {
    cmd = {DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver", "--stdio"},
    on_attach = require'lsp'.common_on_attach,
    capabilities = capabilities
}
