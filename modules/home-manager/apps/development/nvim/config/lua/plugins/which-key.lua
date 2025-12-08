return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    require("which-key").add({
      { "<leader>r", group = "refactor" },
      { "<leader>e", group = "diagnostics" },
      { "<leader>v", group = "views" },
    })
  end,
}
