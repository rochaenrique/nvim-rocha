local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({
        buffer = bufnr, 
        preserve_mappings = false
    })
end)

require('mason').setup({})
require('mason-lspconfig').setup({

	-- ensure_installed = {'tsserver', 'gopls', 'clangd'},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
	}
})
