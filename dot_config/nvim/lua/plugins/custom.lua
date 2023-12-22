-- https://www.josean.com/posts/neovim-linting-and-formatting

local plugins = {
  {
    "LazyVim/LazyVim",
    opts = {
      -- We've tried "slate" but the color for indentation is too aggressive.
      colorscheme = "tokyonight",
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
        python = { "isort", "black" },
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
}

return plugins
