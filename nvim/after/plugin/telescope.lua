-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
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

local opts = { noremap = true, silent = true }

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, opts)
vim.keymap.set('n', '<c-t>', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)
