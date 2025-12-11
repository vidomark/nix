return {
  "neovim/nvim-lspconfig",
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
      jsonnet_ls = {},
      ["*"] = {
        keys = {
          { "<leader>cr", false }, -- Disable the default rename keymap
          { "<leader>rn", vim.lsp.buf.rename, desc = "Rename" },
          { "gi", vim.lsp.buf.implementation, desc = "Goto Implementation" },
          { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", has = "definition", desc = "Goto Definition" },
        },
      },
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
      jsonnet_ls = function(_, opts)
        require("lspconfig").jsonnet_ls.setup({})
      end,

      -- Specify * to use this function as a fallback for any server
      -- ["*"] = function(server, opts) end,
    },
  },
}
