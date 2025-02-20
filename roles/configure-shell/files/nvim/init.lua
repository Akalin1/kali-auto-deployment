-- Set 24-bit colour
vim.opt.termguicolors = true
vim.opt.encoding = "utf-8"

-- Clipboard
-- Using the System Clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Sidebar
vim.opt.number = true    -- set nu
vim.opt.numberwidth = 3

-- Setting indents and tab
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- LeaderKey 'space'
vim.g.mapleader = " "

-- store Lazy plugins path
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- If Lazy Not exists,Download it
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
-- Add the LazyPlugin path to runtimepath
vim.opt.rtp:prepend(lazypath)

-- Load lazy
require("lazy").setup({
-- Import lua/Plugins *.lua
  spec = {
    { import = "plugins" },
  },
  -- Colorscheme that will be used when installing plugins
  install = { colorscheme = { "habamax" } },
  -- Automatically check plugin updates
  checker = { enabled = true },
})



