-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here


-- -- ---------------------- Keybindings ------------------------------
local opts = { noremap = true, silent = true }

-- Indent and Unindent in Normal Mode
vim.keymap.set("n", "<Tab>", ">>", { noremap = true, silent = true }) -- Indent
vim.keymap.set("n", "<S-Tab>", "<<", { noremap = true, silent = true }) -- Unindent

-- Indent and Unindent in Visual Mode
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true }) -- Indent and reselect
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true }) -- Unindent and reselect


local cmp = require("cmp")

vim.keymap.set("i", "<Tab>", function()
  if cmp.visible() then
    cmp.select_next_item()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n", false)
  end
end, { silent = true })

vim.keymap.set("i", "<S-Tab>", function()
  if cmp.visible() then
    cmp.select_prev_item()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, true, true), "n", false)
  end
end, { silent = true })


-- vim.keymap.set("i", "<Tab>", function()
--   require("blink.cmp").select_next()
-- end, { silent = true })

-- vim.keymap.set("i", "<S-Tab>", function()
--   require("blink.cmp").select_prev()
-- end, { silent = true })

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
  { "<leader>C", group = "Cody" },
})

 vim.api.nvim_set_keymap('n', '<leader>Ct', ':CodyToggle<CR>', { noremap = true, silent = true, desc = "Toggle Cody AI Assistant" })
 vim.api.nvim_set_keymap('v', '<leader>Ct', ':CodyToggle<CR>', { noremap = true, silent = true, desc = "Toggle Cody AI Assistant" })

 vim.api.nvim_set_keymap('n', '<leader>C<CR>', ':CodyAsk ', { noremap = true, silent = false, desc = "Ask Cody AI Assistant" })
 vim.api.nvim_set_keymap('v', '<leader>C<CR>', ":CodyAsk ", { noremap = true, silent = false, desc = "Ask Cody AI Assistant" })

-- Keybindings for multicursor
vim.api.nvim_set_keymap("n", "<C-.n>", "<Plug>(multicursor-next)", {})
vim.api.nvim_set_keymap("n", "<C-.p>", "<Plug>(multicursor-prev)", {})

-- Icon picker
vim.api.nvim_set_keymap("n", "<leader>pi", "<cmd>IconPickerYank<cr>", { noremap = true, silent = true, desc = "Pick icon and yank" })