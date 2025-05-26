local plugins = {
  {
    -- Create a Which-Key-Group to hold the trial key mapping.
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>r", group = "refactoring", mode = { "n", "v" } },
        { "<leader>t", group = "trial", mode = { "n", "v" } },
      },
    },
  },

  {
    -- [Linewise selections should include all empty lines below](https://github.com/nvim-treesitter/nvim-treesitter-textobjects/issues/307)
    -- [Treesitter text objects mapping not working or being overwritten](https://www.reddit.com/r/neovim/comments/12x8mbf/treesitter_text_objects_mapping_not_working_or/)
    -- [example config](https://github.com/augustocdias/dotfiles/blob/main/.config/nvim/lua/setup/treesitter.lua)
    "nvim-treesitter/nvim-treesitter",
    -- "nvim-treesitter/nvim-treesitter-textobjects",
    -- main = "nvim-treesitter.configs",
    opts = {
      -- indent = {
      --   enable = true,
      --   -- disable = {
      --     "rust",
      --     "python",
      --   },
      -- },
      textobjects = {
        -- move = {
        --   enable = true,
        --   -- goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
        --   goto_next_start = { ["]z"] = "@function.outer", ["]c"] = "@class.outer" },
        --   goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
        --   goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
        --   goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
        -- },
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            -- You can optionally set descriptions to the mappings (used in the desc parameter of
            -- nvim_buf_set_keymap) which plugins like which-key display
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            ["ak"] = { query = "@comment.outer", desc = "Select outer comment" },
            ["ik"] = { query = "@comment.inner", desc = "Select inner comment" },
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
          },
          -- You can choose the select mode (default is charwise 'v')
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          -- "v" -- charwise
          -- "V" -- linewise
          -- "<c-v>" -- blockwise
          selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.inner"] = "V", -- linewise
            ["@function.outer"] = "V", -- linewise
            ["@class.inner"] = "V", -- linewise
            ["@class.outer"] = "V", -- linewise
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true of false
          -- [Delete @function.outer deletes more than it should](https://github.com/nvim-treesitter/nvim-treesitter-textobjects/issues/575)
          include_surrounding_whitespace = false,
        },
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

  {
    -- [Structural search and replace](https://www.jetbrains.com/help/idea/structural-search-and-replace.html)
    -- [github](https://github.com/cshuaimin/ssr.nvim)
    -- Treesitter based structural search and replace plugin for Neovim.
    "cshuaimin/ssr.nvim",
    keys = {
      {
        "<leader>ts",
        function()
          require("ssr").open()
        end,
        desc = "Structural Search and Replace",
        mode = { "n", "x" },
      },
    },
    opts = {
      border = "rounded",
      min_width = 50,
      min_height = 5,
      max_width = 120,
      max_height = 25,
      adjust_window = true,
      keymaps = {
        close = "q",
        next_match = "n",
        prev_match = "N",
        replace_confirm = "<cr>",
        replace_all = "<leader><cr>",
      },
    },
  },

  -- ---------------------------------------------------
  -- Themes

  {
    -- [github](https://github.com/navarasu/onedark.nvim)
    -- One dark and light colorscheme for neovim >= 0.5.0 written in lua based
    -- on Atom's One Dark and Light theme. Additionally, it comes with 5 color
    -- variant styles.
    "navarasu/onedark.nvim",
    opts = {
      style = "darker",
    },
  },

  {
    -- [github](https://github.com/nyoom-engineering/oxocarbon.nvim)
    -- A dark and light Neovim theme written in fennel, inspired by IBM Carbon.
    "nyoom-engineering/oxocarbon.nvim",
  },

  {
    -- [github](https://github.com/Mofiqul/dracula.nvim)
    -- Dracula colorscheme for neovim written in Lua.
    "Mofiqul/dracula.nvim",
    event = "VeryLazy",
  },

  {
    -- [github](https://github.com/anfigeno/mestizo.nvim)
    -- Mestizo.nvim - A dark theme for those who don't leave home
    "Anfigeno/mestizo.nvim",
  },

  {
    -- [github](https://github.com/echasnovski/mini.colors)
    -- Tweak and save any color scheme. Part of 'mini.nvim' library.
    "echasnovski/mini.colors",
    version = false,
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
    -- [github](https://github.com/mrcjkb/rustaceanvim)
    -- Supercharge your Rust experience in Neovim! A heavily modified fork of rust-tools.nvim.
    "mrcjkb/rustaceanvim",
    version = "^3", -- Recommended
    ft = { "rust" },
  },

  {
    -- [github](https://github.com/kristijanhusak/vim-dadbod-ui)
    -- Simple UI for https://github.com/tpope/vim-dadbod
    --
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      -- dadbod.vim: Modern database interface for Vim
      { "tpope/vim-dadbod", lazy = true },
      -- Database autocompletion powered by https://github.com/tpope/vim-dadbod
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  {
    -- [github](https://github.com/ThePrimeagen/refactoring.nvim)
    -- The Refactoring library based off the Refactoring book by Martin Fowler.
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
    keys = {
      -- Extract function supports only visual mode
      {
        "<leader>re",
        function()
          require("refactoring").refactor("Extract Function")
        end,
        mode = { "x" },
        desc = "Extract Function",
      },
      {
        "<leader>rf",
        function()
          require("refactoring").refactor("Extract Function To File")
        end,
        mode = { "x" },
        desc = "Extract Function to File",
      },
      -- Extract variable supports only visual mode
      {
        "<leader>rv",
        function()
          require("refactoring").refactor("Extract Variable")
        end,
        mode = { "x" },
        desc = "Extract Variable",
      },
      -- Inline func supports only normal
      {
        "<leader>rI",
        function()
          require("refactoring").refactor("Inline Function")
        end,
        mode = { "n" },
        desc = "Extract Inline Function",
      },
      -- Inline var supports both normal and visual mode
      {
        "<leader>ri",
        function()
          require("refactoring").refactor("Inline Variable")
        end,
        mode = { "n", "x" },
        desc = "Extract Inline Variable",
      },
      -- Extract block supports only normal mode
      {
        "<leader>rb",
        function()
          require("refactoring").refactor("Extract Block")
        end,
        mode = { "n" },
        desc = "Extract Block",
      },
      {
        "<leader>rbf",
        function()
          require("refactoring").refactor("Extract Block To File")
        end,
        mode = { "n" },
        desc = "Extract Block to File",
      },
    },
  },

  {
    -- [github](https://github.com/isakbm/gitgraph.nvim)
    -- Git Graph plugin for neovim.
    "isakbm/gitgraph.nvim",
    dependencies = { "sindrets/diffview.nvim" },
    ---@type I.GGConfig
    opts = {
      hooks = {
        -- Check diff of a commit
        on_select_commit = function(commit)
          vim.notify("DiffviewOpen " .. commit.hash .. "^!")
          vim.cmd(":DiffviewOpen " .. commit.hash .. "^!")
        end,
        -- Check diff from commit a -> commit b
        on_select_range_commit = function(from, to)
          vim.notify("DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
          vim.cmd(":DiffviewOpen " .. from.hash .. "~1.." .. to.hash)
        end,
      },
    },
    keys = {
      {
        "<leader>ga",
        function()
          require("gitgraph").draw({}, { all = true, max_count = 5000 })
        end,
        desc = "GitGraph - Draw",
      },
    },
  },

  {
    "snacks.nvim",
    opts = {
      scroll = { enabled = false },
    },
  },

  {
    -- [ollama.nvim](https://github.com/nomnivore/ollama.nvim)
    -- A plugin for managing and integrating your ollama workflows in neovim.
    "nomnivore/ollama.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    -- All the user commands added by the plugin
    cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

    keys = {
      -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
      {
        "<leader>oo",
        ":<c-u>lua require('ollama').prompt()<cr>",
        desc = "ollama prompt",
        mode = { "n", "v" },
      },

      -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
      {
        "<leader>oG",
        ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
        desc = "ollama Generate Code",
        mode = { "n", "v" },
      },
    },

    -- ---@type Ollama.Config
    opts = {
      model = "mistral",
      url = "http://127.0.0.1:11434",
      serve = {
        on_start = false,
        command = "ollama",
        args = { "serve" },
        stop_command = "pkill",
        stop_args = { "-SIGTERM", "ollama" },
      },
      -- View the actual default prompts in ./lua/ollama/prompts.lua
      prompts = {
        Sample_Prompt = {
          prompt = "This is a sample prompt that receives $input and $sel(ection), among others.",
          input_label = "> ",
          model = "mistral",
          action = "display",
        },
      },
    },
  },
}

return plugins
