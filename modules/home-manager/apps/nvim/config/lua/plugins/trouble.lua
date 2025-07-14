return {
  "folke/trouble.nvim",
  keys = {
    { "<leader>vP", "<cmd>Trouble diagnostics toggle<cr>", desc = "Document diagnostics" },
    { "<leader>vp", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics" },
    { "<leader>xx", false },
    { "<leader>xX", false },
  },
}
