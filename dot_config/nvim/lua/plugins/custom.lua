-- https://www.josean.com/posts/neovim-linting-and-formatting

local plugins = {
  {
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
        colors.hint = colors.orange
        colors.error = "#ff0000"
        colors.comment = "#34363d"
      end,
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>gf", "<cmd>Telescope git_files<CR>", desc = "files" },
    },
  },

  {
     "lewis6991/gitsigns.nvim",
     signs = {
        add          = { text = '+' },
        change       = { text = '-' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
     },
     opts = {
        linehl = true, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = true, -- Toggle with `:Gitsigns toggle_word_diff`
     },
  },

  {
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
    -- Don't reload workspace.
    "folke/persistence.nvim",
    enabled = false,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        python = { "isort", "black", "ruff" },
      },
      -- Set up format-on-save
      -- format_on_save = { timeout_ms = 500, lsp_fallback = true },
      -- Customize formatters
      formatters = {
        shfmt = {
          -- --i, --indent uint       0 for tabs (default), >0 for number of spaces
          -- -sr, --space-redirects   redirect operators will be followed by a space
          -- -kp, --keep-padding      keep column alignment paddings
          prepend_args = { "-i", "3", "-sr", "-kp" },
        },
      },
    },
  },

  {
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
}

return plugins
