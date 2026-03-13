local opt = vim.opt

-- line number
opt.relativenumber = true
opt.number = ture

-- indent
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- unwarp
opt.wrap = false

-- cursor
opt.cursorline = true

-- mouse cursor
opt.mouse:append("a")

-- system copy paste
opt.clipboard:append("unnamedplus")

-- default new window right below
opt.splitright = true
opt.splitbelow = true

-- search
opt.ignorecase = true
opt.smartcase = true

-- outlook
opt.termguicolors = true
opt.signcolumn = "yes"
vim.cmd[[colorscheme tokyonight-moon]]
