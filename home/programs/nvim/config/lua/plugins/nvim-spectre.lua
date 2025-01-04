return {
  "nvim-pack/nvim-spectre",
  keys = {
    {
      "<leader>fr",
      "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
      desc = "Search in current file",
    },
    { "<leader>fR", "<cmd>lua require('spectre').toggle()<CR>", desc = "Toggle Spectre" },
    { "<leader>sr", false },
  },
}
