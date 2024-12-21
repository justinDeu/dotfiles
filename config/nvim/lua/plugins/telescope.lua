return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
        require("telescope").load_extension('harpoon')

        local builtin = require('telescope.builtin')
        local actions = require("telescope.actions")

        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fm', ':Telescope harpoon marks<CR>', {})
        vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
        vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})

        local open_with_trouble = require("trouble.sources.telescope").open

        -- Use this to add more results without clearing the trouble list
        local add_to_trouble = require("trouble.sources.telescope").add

        local telescope = require("telescope")

        telescope.setup({
          defaults = {
            mappings = {
              i = { ["<c-t>"] = open_with_trouble },
              n = { ["<c-t>"] = open_with_trouble },
            },
          },
        })
    end
}
