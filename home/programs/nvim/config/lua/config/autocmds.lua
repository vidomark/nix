-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("silent! lcd %:p:h")
  end,
  pattern = "*",
  desc = "Set working directory to the directory where Neovim is opened",
})
