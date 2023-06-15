-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- This file is automatically loaded by plugins.config

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt
local indent = 2

opt.autowrite = true -- 自动保存
opt.backup = false -- 关掉swap提醒替换
-- opt.clipboard = "unnamedplus" -- 与系统共享剪贴板
opt.completeopt = "menu,menuone,noselect" -- 自动补全模式，弹出菜单，只有一个也弹，不要自动选择第一个
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.confirm = true -- 未保存退出，弹出确认框
opt.cursorline = true -- 光标所在行高亮
opt.expandtab = true -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep" -- 用rg替换grep
opt.ignorecase = true -- 搜索忽略大小写
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 0 -- 不显示状态栏
opt.list = true -- 显示不可见字符
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup透明度
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- 显示相对行数
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true -- 缩进列数对齐到 shiftwidth 的整数倍
opt.shiftwidth = indent -- (自动) 缩进使用的步进单位
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false -- 底部模式状态显示
opt.sidescrolloff = 8 -- 横滚留位
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spell = true -- Enable spell check
opt.spelllang = { "en", "cjk" } -- Set language: English and Chinese
opt.spelloptions = "camel" -- Enable camel case
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = indent -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 500 -- Set wait time
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

if vim.fn.has("nvim-0.9.0") == 1 then
  opt.splitkeep = "screen"
  opt.shortmess:append({ C = true })
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
