local plugins = {
  {
    -- Create a Which-Key-Group to hold the trial key mapping.
    "folke/which-key.nvim",
    opts = {
      defaults = {
        mode = { "n", "v" },
        ["<leader>t"] = { name = "+trial" },
      },
    },
  },

  {
    -- [github](https://github.com/pwntester/octo.nvim?tab=readme-ov-file)
    -- Edit and review GitHub issues and pull requests from the comfort of your favorite editor.
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      -- OR 'ibhagwan/fzf-lua',
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
    cmd = "Octo",
    -- event = "VeryLazy",
  },

  },

  {
    -- [github](https://github.com/Mofiqul/dracula.nvim)
    -- Dracula colorscheme for neovim written in Lua.
    "Mofiqul/dracula.nvim",
    event = "VeryLazy",
  },

  {
    -- [github](https://github.com/echasnovski/mini.colors)
    -- Tweak and save any color scheme. Part of 'mini.nvim' library.
    "echasnovski/mini.colors",
    version = false,
  },

  {
    -- [github](https://github.com/echasnovski/mini.indentscope)
    -- Neovim Lua plugin to visualize and operate on indent scope. Part of 'mini.nvim' library.
    -- NOTE: Wanted to use `[i` to progressively expand a selection based on indentation but this does NOT work
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
    -- NavBuddy
    -- [github](https://github.com/SmiteshP/nvim-navbuddy)
    -- A simple popup display that provides breadcrumbs feature using LSP server
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
    -- [github](https://github.com/sindrets/diffview.nvim)
    -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
    -- NOTE: Could this replace VCSVimDiff?
    "sindrets/diffview.nvim",
    keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView a replacement for VCSVimDiff" } },
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
  },

  {
    -- [github](https://github.com/mrcjkb/rustaceanvim)
    -- Supercharge your Rust experience in Neovim! A heavily modified fork of rust-tools.nvim.
    "mrcjkb/rustaceanvim",
    version = "^3", -- Recommended
    ft = { "rust" },
  },
}

return plugins
