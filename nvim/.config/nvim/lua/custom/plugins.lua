local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "eslint-lsp",
        "lua-language-server",
        "html-lsp",
        "pyright",
        "mypy",
        "ruff",
        "gopls",
        "goimports",
        "debugpy",
        "rust-analyzer",
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config=function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },{
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  }, {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
  }, {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function (_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
      require('dap.ext.vscode').load_launchjs(nil, {})
    end
  },{
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = "mfussenegger/nvim-dap",
    config = function (_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end
  },
  {
    "NVChad/nvim-autopairs",
    enabled = false
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function (_, opts)
      require("rust-tools").setup(opts)
    end,
    dependencies = "neovim/nvim-lspconfig"
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function ()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, {name = "crates"})
      return M
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    init = function()
      require("dapui").setup()
      vim.fn.sign_define('DapBreakpoint', { text = '🐞' })
      vim.fn.sign_define('DapBreakpointRejected', { text = '🐞' })
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end
  }
}
return plugins
