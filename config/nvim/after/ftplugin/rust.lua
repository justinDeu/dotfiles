local bufnr = vim.api.nvim_get_current_buf()

local function desc(description)
  return { noremap = true, silent = true, buffer = bufnr, desc = description }
end

vim.keymap.set("n", "<leader>a", function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)

vim.keymap.set('v', 'K', function() vim.cmd.RustLsp { 'hover', 'range' } end, desc('rust: hover range'))

vim.keymap.set('n', '<space>rr', function()
  vim.cmd.RustLsp('runnables')
end, desc('[r]ust: [r]unnables'))
vim.keymap.set('n', '<space>rl', function()
  vim.cmd.RustLsp { 'runnables', bang = true }
end, desc('[r]ust: [r]unnables [l]ast'))

vim.keymap.set('n', '<space>rtt', function()
  vim.cmd.RustLsp('testables')
end, desc('[r]ust: [t]es[t]ables'))
vim.keymap.set('n', '<space>rtl', function()
  vim.cmd.RustLsp { 'testables', bang = true }
end, desc('[r]ust: run [t]estables [l]ast'))

