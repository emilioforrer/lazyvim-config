return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  cmd = "Copilot",
  priority = 1000,  -- Higher priority to load earlier
  enabled = true,
  config = function()
    require("copilot").setup({
      suggestion = { 
        enabled = false,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<Tab>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = false },
    })
    
    -- -- Force enable suggestions on startup
    -- vim.api.nvim_create_autocmd("VimEnter", {
    --   callback = function()
    --     vim.defer_fn(function()
    --       vim.cmd("Copilot suggestion")
    --     end, 100)
    --   end,
    -- })
  end,
}
