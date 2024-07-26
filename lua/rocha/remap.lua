vim.g.mapleader = " " 

vim.keymap.set("n", "<leader>gl", vim.cmd.Ex)

-- Open the terminal in new window (vertical)
vim.keymap.set("n", "<leader>vt", "<cmd>vert bo split +ter<CR>A")

-- Open the terminal in new window (horizontal)
vim.keymap.set("n", "<leader>ht", "<cmd>hor bo split +ter<CR>A")

-- Close the terminal
vim.keymap.set("t", "<c-q>", function()  
    if vim.o.buftype == 'terminal'
        then vim.cmd [[close]] 
    end
end, { remap = true })
