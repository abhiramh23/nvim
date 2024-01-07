local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
local status_ok = pcall(require, "settings")
if not status_ok then
  vim.notify("settings not load")
end
local status_ok1 = require("lazy").setup("plugins")
if not status_ok1 then
  vim.notify("plugins not load")
end
local status_ok2 = pcall(require, "keybindings")

if not status_ok2 then
  vim.notify("keybindings not load")
end
