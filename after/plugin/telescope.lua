require('telescope').setup({
    defaults = {
        --border = false,
        --borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        borderchars = { "-", " ", " ", " ", " ", " ", " ", " " },
        srting_strategy = 'ascending',
        selection_strategy = 'follow',
        layout_strategy = 'vertical',
        layout_config = { 
            vertical = { 
                height = 0.65, 
                width = 0.99,
                preview_height = 0.4,
                preview_cutoff = 0.1,
                anchor = 'S',
                prompt_position = 'bottom',
            }
        }, 
        mappings = {
            i = {
                ["<C-n>"] = require('telescope.actions').cycle_history_next,
                ["<C-p>"] = require('telescope.actions').cycle_history_prev,
                ["<C-e>"] = require('telescope.actions').move_selection_next,
                ["<C-y>"] = require('telescope.actions').move_selection_previous,
                ["<C-s>"] = require('telescope.actions.layout').toggle_preview,
            },
        },
        preview = { 
            hide_on_startup = true
        }
    }
})
