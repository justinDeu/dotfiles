local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", function()
    print("File marked!")
    mark.add_file()
end)

vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
