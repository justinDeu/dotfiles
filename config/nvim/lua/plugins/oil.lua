return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  config = function ()
    require("oil").setup({
     keymaps = {
        ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
        ["<C-x>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
    },
    float = {
        padding=10,
    }
    })

    vim.keymap.set("n", "<C-Space>", function() require("oil").toggle_float() end)
  end
}
