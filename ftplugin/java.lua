-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
local config = {
    cmd = {
        vim.fn.expand '~/.local/share/nvim/mason/packages/jdtls/jdtls',
    },
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw', 'src'}, { upward = true })[2]),
}
require('jdtls').start_or_attach(config)
