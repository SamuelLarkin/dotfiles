-- [How To Setup Linting & Formatting In Neovim And Replace null-ls](https://www.josean.com/posts/neovim-linting-and-formatting)

local plugins = {
  {
    --[github](https://github.com/LazyVim/LazyVim)
    -- Neovim config for the lazy.
    "LazyVim/LazyVim",
    opts = {
      -- We've tried "slate" but the color for indentation is too aggressive.
      colorscheme = "tokyonight-night",
    },
  },

  {
    -- [github](https://github.com/folke/tokyonight.nvim)
    -- 🏙 A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins. Includes additional themes for Kitty, Alacritty, iTerm and Fish.
    -- [Make TokyoNight Transparent](https://www.lazyvim.org/configuration/recipes#make-tokyonight-transparent)
    -- TODO: Change the comment background color to a darker one.
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      transparent = false,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      -- Change the "hint" color to the "orange" color, and make the "error" color bright red
      on_colors = function(colors)
        colors.hint = "#a64f11"
        colors.error = "#870d0d"
        colors.comment = "#45474e"
      end,
    },
  },

  {
    -- [github](https://github.com/nvim-telescope/telescope.nvim)
    -- Find, Filter, Preview, Pick. All lua, all the time.
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>ct", "<cmd>Telescope treesitter<CR>", desc = "treesitter symbols" },
      { "<leader>fg", "<cmd>Telescope git_files<CR>", desc = "git files" },
      { "<leader>gf", "<cmd>Telescope git_files<CR>", desc = "git files" },
      { "<leader>sz", "<cmd>Telescope treesitter<CR>", desc = "treesitter symbols" },
    },
  },

  {
    -- [github](https://github.com/L3MON4D3/LuaSnip)
    -- Snippet Engine for Neovim written in Lua.
    "L3MON4D3/LuaSnip",
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    config = function(_LazyPlugin, opts)
      require("luasnip").setup(opts)
      local ls = require("luasnip")
      -- some shorthands...
      local snip = ls.snippet
      local node = ls.snippet_node
      local text = ls.text_node
      local insert = ls.insert_node
      local func = ls.function_node
      local choice = ls.choice_node
      local dynamicn = ls.dynamic_node

      ls.add_snippets(nil, {
        all = {
          snip({
            trig = "github_link",
            desc = "Add a markdown link to github",
          }, {
            text("[github]("),
            insert(1, "https://github.com/"),
            text(")"),
          }),
        },
      })
      ls.add_snippets("python", {
        snip({
          trig = "_pudb_",
          desc = "Insert a pudb breakpoint",
        }, text("import pudb; pudb.set_trace()")),
        snip({
          trig = "_test_",
          desc = "Testing luasnip",
        }, text("import pudb; pudb.set_trace()")),
      })
    end,
  },

  {
    -- Gitsigns
    -- [github](https://github.com/lewis6991/gitsigns.nvim)
    -- Git integration for buffers
    "lewis6991/gitsigns.nvim",
    signs = {
      add = { text = "+" },
      change = { text = "-" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" },
    },
    opts = {
      linehl = true, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = true, -- Toggle with `:Gitsigns toggle_word_diff`
    },
  },

  {
    -- Mason
    -- [github](https://github.com/williamboman/mason.nvim)
    -- Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "awk-language-server",
        "bash-language-server",
        "black",
        "css-lsp",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "flake8",
        "golangci-lint-langserver",
        "gopls",
        "html-lsp",
        "jq",
        "jq-lsp",
        "json-lsp",
        "lua-language-server",
        "mypy",
        "nimlsp",
        "perlnavigator",
        "prettier",
        "pyright",
        "ruff",
        "rust-analyzer",
        "shellcheck",
        "shfmt",
        "sqlls",
        "stylua",
        "vue-language-server",
        "yaml-language-server",
      },
    },
  },

  {
    -- [github](https://github.com/folke/persistence.nvim)
    -- 💾 Simple session management for Neovim.
    -- Don't reload workspace.
    "folke/persistence.nvim",
    enabled = false,
  },

  {
    -- [github](https://github.com/stevearc/conform.nvim)
    -- Lightweight yet powerful formatter plugin for Neovim.
    "stevearc/conform.nvim",
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        python = { "isort", "black", "ruff" },
        html = { "prettier" },
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        ["_"] = { "trim_whitespace" },
      },
      -- Set up format-on-save
      -- format_on_save = { timeout_ms = 500, lsp_fallback = true },
      -- Customize formatters
      formatters = {
        shfmt = {
          -- --i, --indent uint       0 for tabs (default), >0 for number of spaces
          -- -sr, --space-redirects   redirect operators will be followed by a space
          -- -kp, --keep-padding      keep column alignment paddings
          prepend_args = { "--indent", "3", "--space-redirects", "--keep-padding" },
        },
        -- [Options](https://github.com/JohnnyMorganz/StyLua#options)
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
      },
    },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- [To remove the CR mapping, set the value of key "CR" to nil](https://github.com/LazyVim/LazyVim/discussions/2549#discussioncomment-8503533)
      opts.mapping["<CR>"] = nil
    end,
  },

  {
    -- [github](https://github.com/mfussenegger/nvim-lint)
    -- An asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support.
    "mfussenegger/nvim-lint",
    opts = {
      -- Event to trigger linters
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {
        fish = { "fish" },
        python = { "ruff", "flake8", "mypy" },
        json = { "jq" },
        -- Use the "*" filetype to run linters on all filetypes.
        -- ['*'] = { 'global linter' },
        -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
        -- ['_'] = { 'fallback linter' },
      },
      -- LazyVim extension to easily override linter options
      -- or add custom linters.
      ---@type table<string,table>
      linters = {
        -- -- Example of using selene only when a selene.toml file is present
        -- selene = {
        --   -- `condition` is another LazyVim extension that allows you to
        --   -- dynamically enable/disable linters based on the context.
        --   condition = function(ctx)
        --     return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
        --   end,
        -- },
      },
    },
  },

  {
    -- [github](https://github.com/HiPhish/rainbow-delimiters.nvim)
    -- Rainbow delimiters for Neovim with Tree-sitter.
    -- [help](https://github.com/HiPhish/rainbow-delimiters.nvim/blob/master/doc/rainbow-delimiters.txt)
    -- `:h rainbow-delimiters`
    "HiPhish/rainbow-delimiters.nvim",
  },

  {
    -- [github](https://github.com/hedyhli/outline.nvim)
    -- Code outline sidebar powered by LSP. Significantly enhanced & refactored fork of symbols-outline.nvim.
    "hedyhli/outline.nvim",
    opts = {
      outline_window = {
        -- Auto close the outline window if goto_location is triggered and not for
        -- peek_location
        auto_close = true,
      },
    },
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
    event = "VeryLazy",
  },
}

return plugins
