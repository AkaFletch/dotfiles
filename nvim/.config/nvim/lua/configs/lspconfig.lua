-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require("nvchad.configs.lspconfig")

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
	})
end

lspconfig.gopls.setup({
	on_attach = nvlsp.on_attach,
	capabilities = nvlsp.capabilities,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	settings = {
		completeUnimported = true,
		usePlaceholders = true,
		analyses = {
			unusedparams = true,
		},
	},
})

lspconfig.ts_ls.setup({
	on_attach = nvlsp.on_attach,
	capabilities = nvlsp.capabilities,
	init_options = {
		preferences = {
			disableSuggestions = true,
		},
	},
})

lspconfig.tailwindcss.setup({
	on_attach = nvlsp.on_attach,
	capabilities = nvlsp.capabilities,
})

lspconfig.pyright.setup({
	on_attach = nvlsp.on_attach,
	capabilities = nvlsp.capabilities,
	filetypes = { "python" },
})

lspconfig.eslint.setup({
	on_attach = nvlsp.on_attach,
	capabilities = nvlsp.capabilities,
})

lspconfig.golangcilsp = {
	default_config = {
		cmd = { "golangci-lint-langserver" },
		root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
		init_options = {
			command = {
				"golangci-lint",
				"run",
				"--output.json.path",
				"stdout",
				"--show-stats=false",
				"--issues-exit-code=1",
			},
		},
	},
}

lspconfig.golangci_lint_ls.setup({
	filetypes = { "go", "gomod" },
})

require("sonarlint").setup({
	server = {
		cmd = {
			"sonarlint-language-server",
			-- Ensure that sonarlint-language-server uses stdio channel
			"-stdio",
			"-analyzers",
			vim.fn.expand("$MASON/share/nvim/mason/share/sonarlint-analyzers/sonargo.jar"),
			vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
			vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
		},
		settings = {
			sonarlint = {
				test = "test",
			},
		},
	},
	filetypes = {
		"python",
		"go",
		"javascript",
		"typescript",
	},
})
