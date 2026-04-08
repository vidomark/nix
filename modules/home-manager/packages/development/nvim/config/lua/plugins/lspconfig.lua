return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          { "<leader>cr", false },
          { "<leader>rn", vim.lsp.buf.rename, desc = "Rename" },
          { "gi", vim.lsp.buf.implementation, desc = "Goto Implementation" },
          { "gd", vim.lsp.buf.definition, has = "definition", desc = "Goto Definition" },
        },
      },
      pyright = {},
      eslint = {},
      jsonnet_ls = {},
    },
    setup = {
      eslint = function()
        Snacks.util.lsp.on({ name = "eslint" }, function(_, client)
          client.server_capabilities.documentFormattingProvider = true
        end)
      end,
      jsonnet_ls = function(_, opts)
        require("lspconfig").jsonnet_ls.setup({})
      end,
    },
  },
}
