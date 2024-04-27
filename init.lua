-- Boostrap the lazy.nvim plugin manager
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

-- These modules are loaded by default
require("core.options")
require("core.keymaps")

-- Initialize lazy with dynamic laoding of plugins
require("lazy").setup(
  {
    { import = "plugins" },
    { import = "plugins.python" },
    { import = "plugins.rust" },
  },
  {
    change_detection = {
      enable = false,  -- Detect changes in the plugins directory
      notify = false, -- Do not notify on changes
    }
  }
)
