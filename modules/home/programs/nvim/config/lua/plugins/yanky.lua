return {
  "gbprod/yanky.nvim",
  recommended = true,
  desc = "Better Yank/Paste",
  event = "LazyFile",
  opts = {
    highlight = { timer = 150 },
  },
  keys = {
    {
      "<leader>sy",
      function()
        if LazyVim.pick.picker.name == "telescope" then
          require("telescope").extensions.yank_history.yank_history({})
        else
          vim.cmd([[YankyRingHistory]])
        end
      end,
      mode = { "n", "x" },
      desc = "Open Yank History",
    },
    { "<leader>p", false },
  },
}
