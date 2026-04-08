return {
  -- Broken with Neovim 0.12 (ft_to_lang removed)
  { "mrcjkb/haskell-snippets.nvim", enabled = false },

  -- haskell-tools uses vim.g.haskell_tools, not setup()
  -- Provide explicit config to prevent lazy.nvim from calling setup()
  {
    "mrcjkb/haskell-tools.nvim",
    config = function()
      local ok, telescope = pcall(require, "telescope")
      if ok then
        telescope.load_extension("ht")
      end
    end,
  },
}
