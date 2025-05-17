vim.g.mapleader = " " 

vim.keymap.set("n", "<leader>gl", vim.cmd.Ex)

-- navigate diagnostics
vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)
vim.keymap.set("n", "[dt", function() require('rocha.diagnostic').toggle_diagnostic() end);

-- telescope
local tsbi = require('telescope.builtin')
vim.keymap.set('n', '<leader>lf', tsbi.find_files)
vim.keymap.set('n', '<leader>gf', tsbi.git_commits)
vim.keymap.set('n', '<leader>fg', tsbi.live_grep)
vim.keymap.set('n', '<leader>gs', tsbi.grep_string)
vim.keymap.set('n', '<leader>fb', tsbi.buffers)

-- dap config
local dap = require('dap')
vim.keymap.set('n', '<leader><C-b>', function() dap.continue() end)
vim.keymap.set('n', '<leader>so', function() dap.step_over() end)
vim.keymap.set('n', '<leader>si', function() dap.step_into() end)
vim.keymap.set('n', '<leader>se', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function() require('dap.ui.widgets').hover() end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function() require('dap.ui.widgets').preview() end) 
vim.keymap.set('n', '<Leader>df', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.frames) end) 
vim.keymap.set('n', '<Leader>ds', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.scopes) end)

--jdtls stuff
--vim.keymap.set("n", "<A-o>", function() require'jdtls'.organize_imports() end)
--vim.keymap.set("n", "crv", function() require('jdtls').extract_variable() end)
--vim.keymap.set("v", "crv", function() require('jdtls').extract_variable(true) end)
--vim.keymap.set("n", "crc", function() require('jdtls').extract_constant() end)
--vim.keymap.set("v", "crc", function() require('jdtls').extract_constant(true) end)
--vim.keymap.set("v", "crm", function() require('jdtls').extract_method(true) end)

--create getter (java)
vim.keymap.set("n", "<leader>gj", function() 
    local buf = vim.api.nvim_get_current_buf()
    local row = vim.api.nvim_win_get_cursor(0)[1] - 1
    local line = vim.api.nvim_buf_get_lines(buf, row, row + 1, false)[1]

    local type, name = line:match("(%w[^%s]*)%s+(%w%w*);")

    if type and name then 
        line = vim.fn.search("\\<class\\>", "n")
        if line > 0 then 
            vim.api.nvim_win_set_cursor(0, {line, 0})
            vim.cmd('normal! %')
            line = vim.fn.line('.')

            vim.api.nvim_buf_set_lines(0, line - 1, line -1, false, {
                "",
                "public " .. type .. " get" .. name:sub(1,1):upper() .. name:sub(2) .. "() {", 
                "\treturn this." .. name .. ";", 
                "}"
            })
            vim.cmd('normal! ={j0w')
        else
            print("'class' not found in the buffer.")
        end
    else 
        print("Could not extract type and name from: " .. line)
    end
end)
