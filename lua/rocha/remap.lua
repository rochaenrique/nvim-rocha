vim.g.mapleader = " " 

vim.keymap.set("n", "<leader>gl", vim.cmd.Ex)

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
vim.keymap.set("n", "crv", function() require('jdtls').extract_variable() end)
vim.keymap.set("v", "crv", function() require('jdtls').extract_variable(true) end)
vim.keymap.set("n", "crc", function() require('jdtls').extract_constant() end)
vim.keymap.set("v", "crc", function() require('jdtls').extract_constant(true) end)
vim.keymap.set("v", "crm", function() require('jdtls').extract_method(true) end)
