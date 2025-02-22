local M = {}

vim.keymap.set("n", "]g", function ()
  vim.diagnostic.goto_next()
end)
vim.keymap.set("n", "[g", function ()
  vim.diagnostic.goto_prev()
end)

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require("dap.ui.widgets");
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "open debugging sidebar"
    }
  }
}

M.dap_go = {
  plugin=true,
  n = {
    ["<leader>gdt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test"
    },
    ["<leader>gdl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.dapui = {
  n = {
    ["<leader>dui"] = {
      function()
        require("dapui").toggle()
      end,
      "Open debuging ui"
    }
  }
}

M.lsp = {
  n = {
    ["<leader>ww"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "What's wrong with this line?"
    }
  }
}

return M
