local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    go = { "gopls" },
    ts = { "prettier" },
    tsx = { "prettier" },
    js = { "prettier" },
    jsx = { "prettier" }
  },

   format_on_save = {
     -- These options will be passed to conform.format()
     timeout_ms = 500,
     lsp_fallback = true,
   },
}

return options
