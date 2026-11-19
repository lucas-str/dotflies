-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Core settings and local utilities
require("core.options")
require("core.keymaps")
require("core.autocmds")
require("utils")

-- Plugins: every file in lua/plugins/ returns a lazy.nvim spec (or a list of
-- specs). Installed plugins are pinned in lazy-lock.json.
require("lazy").setup({
    spec = { { import = "plugins" } },
    change_detection = { notify = false },
    checker = { enabled = false },
})

-- Loaded only when the file exists.
local profile = vim.fn.stdpath("config") .. "/lua/wk00.lua"
if vim.uv.fs_stat(profile) then
    require("wk00")
end
