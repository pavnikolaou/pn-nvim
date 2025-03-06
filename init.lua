-- to check the standard location of nvim init file run command
-- :echo stdpath('config')
-- C:\Users\nikpa\AppData\Local\nvim
-- :checkhealth
-- plugins


-- https://github.com/nvim-neo-tree/neo-tree.nvim

-- https://github.com/folke/lazy.nvim
-- Bootstrap lazy.nvim
-- clone repository if not exists
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
vim.opt.rtp:prepend(lazypath)

require("nvim-options")
require("lazy").setup("plugins")

