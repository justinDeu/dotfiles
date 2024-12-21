return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function()
        require("todo-comments").setup({})
        vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", {})
        vim.keymap.set("n", "<leader>xt", "<cmd>Trouble todo<CR>", {})
    end
}
