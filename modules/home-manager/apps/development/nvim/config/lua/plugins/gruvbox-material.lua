return {
  "sainnhe/gruvbox-material",
  config = function()
    if vim.fn.has("termguicolors") == 1 then
      vim.opt.termguicolors = true
    end

    vim.opt.background = "dark"
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_transparent_background = 2
    vim.cmd("colorscheme gruvbox-material")
  end,
}
