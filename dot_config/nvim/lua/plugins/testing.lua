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
        keys = { { "<leader>cn", "<cmd>Navbuddy<cr>", desc = "NavbuddyOpen" } },
        opts = { lsp = { auto_attach = true } },
      },
    },
    -- your lsp config or other stuff
  },

  {
    "sindrets/diffview.nvim",
    keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "VCSVimDiff" } },
  },

  {
    -- [github](https://github.com/utilyre/barbecue.nvim)
    -- This is a VS Code like winbar that uses nvim-navic in order to get LSP context from your language server.
    -- Adds a bar at the top of the window like this:
    -- ~  .config  nvim  lua  plugins   testing.lua   plugins   [3]   dependencies   [1]   dependencies
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  }
}

return plugins
