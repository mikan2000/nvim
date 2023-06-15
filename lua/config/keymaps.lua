-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Paste over currently selected text without yanking it
map("v", "p", '"_dP', { silent = true })

-- better movement
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "v", "o" }, "H", "^", { desc = "Use 'H' as '^'" })
map({ "n", "v", "o" }, "L", "$", { desc = "Use 'L' as '$'" })

-- other
map({ "n", "v" }, "J", "7j")
map({ "n", "v" }, "K", "7k")
map("n", "<c-q>", ":q<CR>")
map("n", "U", "<c-r>")
map("i", "(", "()<Left>")
map("i", '"', '""<Left>')
map("i", "<c-h>", "<Left>")
map("i", "<c-l>", "<Right>")
map("i", "jj", "<Right>,<Space>")
map("v", "Y", '"+y')
