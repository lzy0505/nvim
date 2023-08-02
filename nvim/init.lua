vim.cmd('source ~/.vimrc.base')
-- persistent undo
vim.opt.undofile = true
vim.opt.undodir = '/tmp/nvim/undo'
-- per-project .nvim.lua
vim.opt.exrc = true

-- local leader
vim.g.maplocalleader = ' '
-- switch between buffers
vim.keymap.set("n", "<leader>b<Tab>", ":Next<CR>", {desc = "[N]ext Buffer"})
vim.keymap.set("n", "<leader>bn", ":Next<CR>", {desc = "[N]ext Buffer"})
vim.keymap.set("n", "<leader>bp", ":previous<CR>", {desc = "[P]revious Buffer"})

-- FIXME: ???
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- better yank/paste
vim.keymap.set ({"n", "v"}, "<leader>y", '"*y', {desc = "[Y]ank"})
vim.keymap.set ({"n"}, "<leader>p", '"*p', {desc = "[P]aste"})
vim.keymap.set ({"v"}, "p", '"_dhp', {desc = "[P]aste"})

-- move to the end of words
vim.keymap.set ({"n"}, "w", 'e')

-- stay in VISUAL after indentaion
vim.keymap.set ({"v"}, "<", '<gv')
vim.keymap.set ({"v"}, ">", '>gv')

-- select all
vim.keymap.set ({"n", "v"}, "cmd-a", 'ggVG<CR>')
-- save
vim.keymap.set ({"n", "v"}, "cmd-s", ':w<CR>')

-- FIXME ???
-- cmap ww w !sudo tee %
-- nmap gp '.

-- FIXME: map all <c-w>? to <leader>w?.
vim.keymap.set ({"n", "v"}, "<leader>w", '<C-w>')

-- noremap <Up> <c-w>k 
-- noremap <Down> <c-w>j
-- noremap <Left> <c-w>h
-- noremap <Right> <c-w>l


-- folding shortcuts
-- vim.keymap.set("n", "<space>", "@=((foldclosed(line('.')) < 0) ? 'zc' : 'zO')<CR>")
-- vim.keymap.set("n", "za", "zM")
-- vim.keymap.set("n", "zo>", "zO")

-- import math symbols map
vim.cmd('source ~/.vimrc.unimap')

local is_ssh = os.getenv("SSH_CONNECTION") or os.getenv("SSH_CLIENT")
if not is_ssh then
    -- lazyvim
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--depth=1",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)
    local opts = {
        install = {
            -- try to load one of these colorschemes when starting an installation during startup
            colorscheme = { "tokyonight-storm" },
        },
    }
    require("lazy").setup("plugins", opts)
end
