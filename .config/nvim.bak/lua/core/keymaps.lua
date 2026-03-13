-- this has move to plugins/plugins-setup.lua since that get to load first
-- vim.g.mapleader = " "

local keymap = vim.keymap

------ insert mode ------
keymap.set("i", "jk", "<ESC>")

------ visual mode ------
-- move single/multiple line
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

------ normal mode ------
-- window 
keymap.set("n", "<leader>sv", "<C-w>v") -- horizontal
keymap.set("n", "<leader>sh", "<C-w>s") -- vertical

-- no highlight 
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<C-L>", ":bnext<CR>")
keymap.set("n", "<C-H>", ":bprevious<CR>")
