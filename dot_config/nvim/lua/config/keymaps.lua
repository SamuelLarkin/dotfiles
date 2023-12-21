-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- $HOME/larkins/.config/nvim/lua/config/keymaps.lua
vim.keymap.del("n", "Y")

-- https://www.youtube.com/watch?v=DYaTzkw3zqQ
if vim.lsp.inlay_hint then
  vim.keymap.set("n", "<leader>uh", function()
    vim.lsp.inlay_hint(0, nil)
  end, { desc = "Toggle inlay hints" })
end
