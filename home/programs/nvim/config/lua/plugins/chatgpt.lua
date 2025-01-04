return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  config = function()
    local home = vim.fn.expand("$HOME")
    vim.keymap.set("n", "<leader>cg", "<cmd>ChatGPT<CR>", { desc = "Open ChatGPT prompts" })
    require("chatgpt").setup({
      api_key_cmd = "gpg --decrypt " .. home .. "/openai_api_key.gpg",
      openai_params = {
        model = "gpt-4o",
        max_tokens = 16384,
      },
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim", -- optional
    "nvim-telescope/telescope.nvim",
  },
}
