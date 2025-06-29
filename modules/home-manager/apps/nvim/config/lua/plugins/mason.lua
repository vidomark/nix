return {
  -- Version pinning due to breaking change mason 2.0 introducing version change in nvim-lspconfig
  { "mason-org/mason.nvim", version = "^1.0.0" },
  { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
  keys = {
    { "<leader>vm", "<cmd>Mason<cr>", desc = "Mason" },
    { "<leader>cm", false },
  },
}
