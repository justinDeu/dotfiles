return {
    'theprimeagen/harpoon',
    config = function ()
        local ui = require("harpoon.ui")
        local mark = require("harpoon.mark")

        vim.keymap.set("n", "<leader>a", function()
            print("File marked!")
            mark.add_file()
        end)

        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
    end
}
