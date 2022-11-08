require('telescope').setup {
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
}

require('telescope').load_extension('fzf')

require'nvim-treesitter.configs'.setup {
    ensure_installed = {"python"},

    hightlight = {
        enable = true,
    },

    --[[ This is only experimental and currently causing indentation issues in python
    indent = {
        enable = true,
    }
    --]]
}
