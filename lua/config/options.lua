-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here


-- ---------------------- SHARED NEOVIM SETTINGS ------------------------------

-- Create a user command (:Z) to execute zoxide query
vim.api.nvim_create_user_command('Z', function(opts)
    local query = opts.args or ""
    local handle = io.popen('zoxide query "' .. query .. '"')
    if handle then
      local result = handle:read("*a")
      handle:close()
      -- Trim whitespace from the result
      local dir = result:match("^(.-)%s*$")
      if dir and #dir > 0 then
        -- Change Neovim's working directory
        vim.cmd("cd " .. vim.fn.fnameescape(dir))
        print("Directory changed to: " .. dir)
      else
        print("Error: No directory found for query: " .. query)
      end
    else
      print("Error: Failed to execute zoxide command")
    end
  end, { nargs = "?" })


if vim.g.neovide then
  -- ---------------------- NEOVIDE SETTINGS ------------------------------
  -- Set default path in Neovide
  vim.cmd([[autocmd VimEnter * cd ~]])
  -- Helper function for transparency formatting
  local alpha = function()
    return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
  end
  vim.g.neovide_window_blurred = true
  vim.g.neovide_transparency = 0.95
  vim.g.transparency = 0.95
  vim.g.neovide_background_color = "#0f1117" .. alpha()
  vim.g.neovide_cursor_vfx_mode = "railgun"
end



if vim.g.vscode then
  -- ---------------------- VSCODE NEOVIM SETTINGS------------------------------

else
  -- ---------------------- NEOVIM ONLY SETTINGS------------------------------


  -- Configuration

  vim.opt.tabstop = 4
  vim.opt.softtabstop = 4
  vim.opt.shiftwidth = 4
  vim.opt.expandtab = true
  -- vim.o.exrc = true
  -- vim.o.secure = true
  -- vim.opt.clipboard = "unnamedplus"


  
  -- Enable list mode to show whitespace characters
  vim.opt.list = true

  -- Define the symbols for whitespace characters
  vim.opt.listchars = {
      space = '·',       -- Character to show for space
      tab = '→ ',        -- Character to show for tab
      trail = '•',       -- Character to show for trailing spaces
      eol = '↲',         -- Character to show for end of line
  }

  -- Optionally, you can customize the appearance of the whitespace characters using highlight groups
  -- For example, to change the color of the whitespace characters:
  vim.cmd('highlight SpecialKey ctermfg=darkgray guifg=darkgray')
  vim.cmd('highlight NonText ctermfg=darkgray guifg=darkgray')
  vim.cmd('highlight EndOfBuffer ctermfg=darkgray guifg=darkgray')

  -- Function to enable list mode
  local function enable_list_mode()
    vim.opt.list = true
  end

  -- Function to disable list mode
  local function disable_list_mode()
    vim.opt.list = false
  end

  -- Autocommands to toggle list mode based on the mode
  vim.api.nvim_create_autocmd('InsertEnter', {
    pattern = '*',
    callback = disable_list_mode
  })

  vim.api.nvim_create_autocmd('InsertLeave', {
    pattern = '*',
    callback = enable_list_mode
  })

  -- Initially enable list mode when starting in normal mode
  enable_list_mode()

  
end