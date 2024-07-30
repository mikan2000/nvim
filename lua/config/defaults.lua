-- vim.o.autochdir = true
-- vim.o.exrc = true
-- vim.o.secure = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
-- 启用自动缩进
vim.o.autoindent = true
vim.o.list = true
vim.o.listchars = 'tab:|\\ ,trail:▫'
vim.o.scrolloff = 4
-- vim.o.ttimeoutlen = 0
-- vim.o.timeout = false
-- vim.o.viewoptions = 'cursor,folds,slash,unix'
-- vim.o.wrap = true
-- vim.o.textwidth = 0
-- vim.o.indentexpr = ''
-- vim.o.foldmethod = 'indent'
-- vim.o.foldlevel = 99
-- vim.o.foldenable = true
-- vim.o.foldlevelstart = 99
-- vim.o.formatoptions = vim.o.formatoptions:gsub('tc', '')
-- vim.o.splitright = true
-- vim.o.splitbelow = true
-- vim.o.showmode = false
-- vim.o.ignorecase = true
-- vim.o.smartcase = true
-- vim.o.shortmess = vim.o.shortmess .. 'c'
-- vim.o.inccommand = 'split'
-- vim.o.completeopt = 'longest,noinsert,menuone,noselect,preview'
-- vim.o.completeopt = 'menuone,noinsert,noselect,preview'
-- -- vim.o.lazyredraw = true
-- vim.o.visualbell = true
-- vim.o.colorcolumn = '100'
-- vim.o.updatetime = 100
-- vim.o.virtualedit = 'block'

vim.cmd([[
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif
]])

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.md", command = "setlocal spell", })
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", command = "silent! lcd %:p:h", })

vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

-- 当打开终端缓冲区时（比如运行 :term 命令）自动进入插入模式。
vim.cmd([[autocmd TermOpen term://* startinsert]])

-- 在 copy 后高亮
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank({
			timeout = 300,
		})
	end,
})
