lua <<EOF

  local run = function (cmd)
    local handle = io.popen(cmd)
    local result = handle:read("*a")
    handle:close()
    return string.gsub(result, "^%s*(.-)%s*$", "%1")
  end

  local workspace_dir = vim.fn.fnamemodify(run('git rev-parse --show-toplevel'), ':p:h:h')

  local jar = function (install_dir)
    return run('ls ' .. install_dir .. '/plugins/org.eclipse.equinox.launcher_*.jar')
  end

  local install_dir = nil
  local config_dir = nil
  if vim.env.HOME == '/home/' .. vim.env.USER then
      -- Arch linux
      install_dir = '/usr/share/java/jdtls'
      config_dir = install_dir .. '/config_linux'
  elseif vim.env.HOME == '/Users/' .. vim.env.USER then
      -- Mac (jdt-ls installed in home dir)
      install_dir = vim.env.HOME .. '/jdt-ls'
      config_dir = install_dir .. '/config_mac'
  end

  local config = {
    cmd = {
      'java',

      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-Xms1g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

      '-jar', jar(install_dir),
      '-configuration', config_dir,

      '-data', workspace_dir,
    },

    -- This is the default if not provided, you can remove it. Or adjust as needed.
    -- One dedicated LSP server & client will be started per unique root_dir
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
      java = {
      }
    },

    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
      bundles = {}
    },
  }
  require('jdtls').start_or_attach(config)
EOF

if exists('b:did_ftplugin')
    finish
endif

setlocal tabstop=4 softtabstop=4 shiftwidth=4 colorcolumn=


let b:undo_ftplugin = 'setlocal tabstop< softtabstop< shiftwidth< colorcolumn<'
