vim.g.mapleader = " " 

vim.keymap.set("n", "<leader>gl", vim.cmd.Ex)

-- navigate diagnostics
vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

-- Open the terminal in new window (vertical)
vim.keymap.set("n", "<leader>vt", "<cmd>vert bo 82 split +ter<CR>Acls<Enter>")

-- Open the terminal in new window (horizontal)
vim.keymap.set("n", "<leader>ht", "<cmd>hor bo 12 split +ter<CR>Acls<Enter>")

-- Close the terminal
vim.keymap.set("t", "<c-k>", function()  
    if vim.o.buftype == 'terminal'
        then vim.cmd [[quit]] 
        end
    end, { remap = true })

    -- Switch to other window from the terminal
    vim.keymap.set("t", "<c-w>", "<c-\\><c-N><c-W>w", { remap = true })

    --jdtls stuff
    vim.keymap.set("n", "<A-o>", function() require'jdtls'.organize_imports() end)
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
