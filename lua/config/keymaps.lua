-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>m", "@q", { desc = "Play macro q" })
vim.keymap.set("n", "<leader>M", "@@", { desc = "Repeat last macro" })
