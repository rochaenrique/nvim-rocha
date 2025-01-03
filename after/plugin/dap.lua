local dap = require('dap')
dap.adapters.lldb = { 
    type = 'executable', 
    command = '/Applications/Xcode.app/Contents/Developer/usr/bin/lldb-dap', 
    name = 'lldb',
}

dap.configurations.java = {
  {
    name = 'Launch Debug',
    type = 'java',
    request = 'launch',
    mainClass = function()
        return vim.fn.input('Main class: ')
    end,
  },
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.c = dap.configurations.cpp
