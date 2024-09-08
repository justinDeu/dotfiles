return {
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set("n", "<leader>G", "<cmd>tab G<CR>");

        -- Selecting hunks when viewing diffs
        vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>");
        vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>");
    end
}
