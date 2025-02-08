local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd= {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    completeUnimported = true,
    usePlaceholders = true,
    analyses = {
      unusedparams = true,
    }
  }
}

lspconfig.ts_ls.setup{
  on_attach=on_attach,
  capabilities=capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  }
}

lspconfig.tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes= {"python"},
})

lspconfig.eslint.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.golangcilsp = {
  default_config = {
    cmd = {'golangci-lint-langserver'},
    root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
    init_options = {
        command = { "golangci-lint", "run", "--out-format", "json", "--issues-exit-code=1" };
    }
  };
}

lspconfig.golangci_lint_ls.setup {
	filetypes = {'go','gomod'}
}
