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

