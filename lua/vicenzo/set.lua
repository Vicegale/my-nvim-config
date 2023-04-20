-- Phat cursor
vim.opt.guicursor = ""

-- New / Relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Smart Indent
vim.opt.smartindent = true

-- Wrap Text
vim.opt.wrap = false

-- Disable Vim swap file backups
vim.opt.swapfile = false
vim.opt.backup = false

-- Ensure backup tree lasts
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search settings (Highlight only incremental)
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Colors! 
vim.opt.termguicolors = true

-- Scroll limits
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Fast
vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "
