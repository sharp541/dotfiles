-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 相対行番号と現在の行の絶対行番号を同時に表示
vim.opt.number = true -- 絶対行番号を表示
vim.opt.relativenumber = true -- 相対行番号を有効化

-- その他の便利な設定
vim.opt.tabstop = 2 -- タブ幅を2スペースに設定
vim.opt.shiftwidth = 2 -- インデント幅を2スペースに設定
vim.opt.expandtab = true -- タブをスペースに変換
vim.opt.wrap = false -- 行の折り返しを無効化
