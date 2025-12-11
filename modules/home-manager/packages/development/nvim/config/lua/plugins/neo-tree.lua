return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>vf",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          dir = vim.fn.getcwd(),
        })
      end,
      desc = "Explorer NeoTree",
    },
    {
      "<leader>vb",
      function()
        require("neo-tree.command").execute({
          source = "buffers",
          toggle = true,
        })
      end,
      desc = "Buffer Explorer",
    },
    { "<leader>fE", false },
    { "<leader>e", false },
    { "<leader>E", false },
    { "<leader>be", false },
  },
}
