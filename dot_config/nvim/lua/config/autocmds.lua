-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- [The right way to override any highlighting if you don't want to edit the colorscheme file directly](https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f)
-- [Colour scheme setup not working properly](https://www.reddit.com/r/neovim/comments/ytz3lz/comment/iw8r96b/?utm_source=share&utm_medium=web2x&context=3)
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("SamDiffColors", { clear = true }),
  callback = function()
    -- DiffAdd        term=bold ctermfg=193 ctermbg=65 guifg=#d7ffaf guibg=#5f875f
    vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#d7ffaf", bg = "#5f875f" })
    --DiffDelete      term=bold ctermfg=210 ctermbg=167 gui=bold guifg=#ff8080 guibg=#cc6666
    vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#ff8080", bg = "#cc6666" })
  end,
})
