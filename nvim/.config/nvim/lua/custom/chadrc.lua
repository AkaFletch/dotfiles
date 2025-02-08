local M = {}

M.ui = { theme = 'catppuccin', tabufline= {enabled= false} }
M.plugins = "custom.plugins"
M.mappings = require "custom.configs.mappings"
vim.opt.spelllang = 'en_gb'
vim.opt.spell = true
vim.keymap.set("n", "]g", function ()
  vim.diagnostic.goto_next()
end)
vim.keymap.set("n", "[g", function ()
  vim.diagnostic.goto_prev()
end)

return M
