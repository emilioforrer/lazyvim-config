-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here


-- -- ---------------------- Keybindings ------------------------------
local opts = { noremap = true, silent = true }

-- Unindent code with Shift + Tab in insert mode
vim.api.nvim_set_keymap('i', '<S-Tab>', '<C-d>', { noremap = true, silent = true })

-- Mapping for CTRL+a to select all text in normal, insert, and visual mode
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-a>', 'ggVG', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-a>', '<Esc>ggVG', { noremap = true })

-- Change Crtl c to copy to clipboard
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>"+yiw`^i', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true })

vim.api.nvim_set_keymap('i', '<C-C>', '<Esc>"+yiw`^i', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-C>', '"+y', { noremap = true })

-- Delete without copy
vim.api.nvim_set_keymap("v", "<S-d>", '"_d', { noremap = true })

-- Change without copy
vim.api.nvim_set_keymap("n", "<S-c>", '"_c', { noremap = true })

-- -- Some ThePrimeagen binds
vim.api.nvim_set_keymap('n', 'Q', '<nop>', opts)

-- Map jj and jk to escape from insert mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })


-- vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>a', opts)

-- -- Switch from terminal mode to normal mode
-- vim.api.nvim_set_keymap('t', '<C-w>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Register the description for the <leader>p group
local which_key = require("which-key")

-- Register the group using the new format
which_key.add({
  { "<leader>p", group = "Plugins" },
})

 vim.api.nvim_set_keymap('n', '<leader>at', ':CodyToggle<CR>', { noremap = true, silent = true, desc = "Toggle Cody AI Assistant" })
 vim.api.nvim_set_keymap('v', '<leader>at', ':CodyToggle<CR>', { noremap = true, silent = true, desc = "Toggle Cody AI Assistant" })

 vim.api.nvim_set_keymap('n', '<leader>a<CR>', ':CodyAsk ', { noremap = true, silent = false, desc = "Ask Cody AI Assistant" })
 vim.api.nvim_set_keymap('v', '<leader>a<CR>', ":CodyAsk ", { noremap = true, silent = false, desc = "Ask Cody AI Assistant" })

-- Keybindings for multicursor
vim.api.nvim_set_keymap("n", "<C-.n>", "<Plug>(multicursor-next)", {})
vim.api.nvim_set_keymap("n", "<C-.p>", "<Plug>(multicursor-prev)", {})

-- Icon picker
vim.api.nvim_set_keymap("n", "<leader>pi", "<cmd>IconPickerYank<cr>", { noremap = true, silent = true, desc = "Pick icon and yank" })