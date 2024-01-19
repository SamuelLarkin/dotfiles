-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.mouse = "" -- Disable mouse
vim.g.shfmt_extra_args = "-i 3 -sr -kp"
-- [Q: How do I get the diagonal lines in place of deleted lines in diff-mode?](https://github.com/sindrets/diffview.nvim?tab=readme-ov-file#tips-and-faq)
vim.opt.fillchars:append { diff = "╱" }
