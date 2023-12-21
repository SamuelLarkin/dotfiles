local plugins = {
  { "echasnovski/mini.colors", version = false },

  {
    -- Wanted to use `[i` to progressively expand a selection based on indentation but this does NOT work
    "echasnovski/mini.indentscope",
    opts = {
      options = {
        -- Whether to use cursor column when computing reference indent.
        -- Useful to see incremental scopes with horizontal cursor movements.
        indent_at_cursor = true,
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
        },
        keys = { { "<leader>cn", "<cmd>NavbuddyOpen<cr>", desc = "NavbuddyOpen" } },
        opts = { lsp = { auto_attach = true } },
      },
    },
    -- your lsp config or other stuff
  },

  {
    "sindrets/diffview.nvim",
    keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "VCSVimDiff" } },
  },

  --[[
   {
      -- [Make TokyoNight Transparent](https://www.lazyvim.org/configuration/recipes#make-tokyonight-transparent)
      "folke/tokyonight.nvim",
      opts = {
         transparent = true,
         styles = {
            sidebars = "transparent",
            floats = "transparent",
         },
      },
   },
   ]]
  --
}

return plugins
