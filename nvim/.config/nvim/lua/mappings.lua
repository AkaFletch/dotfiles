require("nvchad.mappings")

local map = vim.keymap.set

local M = {}

map("n", "]g", function()
	vim.diagnostic.jump({ count = 1, float = true })
end)
map("n", "[g", function()
	vim.diagnostic.jump({ count = -1, float = true })
end)

map("n", "<leader>ww", function()
	vim.diagnostic.open_float()
end)
