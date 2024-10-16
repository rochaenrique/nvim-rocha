-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = '.jdtls-workspace/' .. project_name
local config = {
    cmd = {
        vim.fn.expand '~/.local/share/nvim/mason/packages/jdtls/jdtls',
        '-data', workspace_dir,
    },
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw', 'src'}, { upward = true })[2]),
    settings = {
        java = {
            project = {
                referencedLibraries = {
                    'src/**/*.java'  -- Includes all Java files in the src directory as part of the classpath
                }
            }
        }
    },
}
require('jdtls').start_or_attach(config)
