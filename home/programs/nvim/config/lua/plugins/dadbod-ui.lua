return {
  "kristijanhusak/vim-dadbod-ui",
  cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
  dependencies = "vim-dadbod",
  keys = {
    { "<leader>vD", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
  },
}
