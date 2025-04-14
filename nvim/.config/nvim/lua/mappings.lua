require "nvchad.mappings"


local map = vim.keymap.set

local M = {}

map("n", "]g", function ()
  vim.diagnostic.goto_next()
end)
map("n", "[g", function ()
  vim.diagnostic.goto_prev()
end)

map("n", "<leader>ww", function()
  vim.diagnostic.open_float()
end)
