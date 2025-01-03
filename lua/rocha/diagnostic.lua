local module = {};
local hidden_state = {
    virtual_text = false,
    signs = false, 
    underline = false
}

vim.diagnostic.config(hidden_state)

local diagnostics_visible = false

function module.toggle_diagnostic() 
    diagnostics_visible = not diagnostics_visible 
    if diagnostics_visible then 
        vim.diagnostic.show()
        vim.diagnostic.config({
            virtual_text = true,
            signs = true, 
            underline = true
        })
        print('Diagnostics on')
    else 
        vim.diagnostic.hide()
        vim.diagnostic.config(hidden_state)
        print('Diagnostics off')
    end
end

return module
