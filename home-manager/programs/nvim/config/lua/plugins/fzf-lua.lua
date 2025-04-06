return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  opts = {
    oldfiles = {
      -- In Telescope, when I used <leader>fr, it would load old buffers.
      -- fzf lua does the same, but by default buffers visited in the current
      -- session are not included. I use <leader>fr all the time to switch
      -- back to buffers I was just in. If you missed this from Telescope,
      -- give it a try.
      include_current_session = true,
    },
    previewers = {
      builtin = {
        -- fzf-lua is very fast, but it really struggled to preview a couple files
        -- in a repo. Those files were very big JavaScript files (1MB, minified, all on a single line).
        -- It turns out it was Treesitter having trouble parsing the files.
        -- With this change, the previewer will not add syntax highlighting to files larger than 100KB
        -- (Yes, I know you shouldn't have 100KB minified files in source control.)
        syntax_limit_b = 1024 * 100, -- 100KB
      },
    },
    grep = {
      -- One thing I missed from Telescope was the ability to live_grep and the
      -- run a filter on the filenames.
      -- Ex: Find all occurrences of "enable" but only in the "plugins" directory.
      -- With this change, I can sort of get the same behaviour in live_grep.
      -- ex: > enable --*/plugins/*
      -- I still find this a bit cumbersome. There's probably a better way of doing this.
      rg_glob = true, -- enable glob parsing
      glob_flag = "--iglob", -- case insensitive globs
      glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
    },
  },
  keys = {
    { "<c-j>", "<c-j>", ft = "fzf", mode = "t", nowait = true },
    { "<c-k>", "<c-k>", ft = "fzf", mode = "t", nowait = true },
    -- find
    { "<leader>fg", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
    { "<leader>fC", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
    { "<leader>sd", "<cmd>FzfLua diagnostics_document<cr>", desc = "Document Diagnostics" },
    { "<leader>sD", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace Diagnostics" },
    {
      "<leader>ss",
      function()
        require("fzf-lua").lsp_document_symbols({
          regex_filter = symbols_filter,
        })
      end,
      desc = "Goto Symbol",
    },
    {
      "<leader>sS",
      function()
        require("fzf-lua").lsp_live_workspace_symbols({
          regex_filter = symbols_filter,
        })
      end,
      desc = "Goto Symbol (Workspace)",
    },
    { "<leader><space>", false },
    { "<leader>:", false },
    { "<leader>/", false },
    { "<leader>,", false },
    { "<leader>.", false },
    { "<leader>S", false },
    { "<leader>sG", false },
    { "<leader>sg", false },
    { "<leader>sG", false },
  },
}
