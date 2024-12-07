local M = {}

M.ui = { theme = 'catppuccin', tabufline= {enabled= false} }
M.plugins = "custom.plugins"
M.mappings = require "custom.configs.mappings"
vim.opt.spelllang = 'en_gb'
vim.opt.spell = true

return M
