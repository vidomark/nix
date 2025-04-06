return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<leader>cr", false }
    table.insert(keys, { "<leader>rn", vim.lsp.buf.rename, desc = "Rename" })
    table.insert(keys, { "gi", vim.lsp.buf.implementation, desc = "Goto Implementation" })
  end,

  dependencies = {
    "jose-elias-alvarez/typescript.nvim",
  },
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      tsserver = {},
      pyright = {},
      eslint = {},
    },
    ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    setup = {
      tsserver = function(_, opts)
        require("typescript").setup({ server = opts })
        return true
      end,
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
      -- Specify * to use this function as a fallback for any server
      -- ["*"] = function(server, opts) end,
    },
  },
}
