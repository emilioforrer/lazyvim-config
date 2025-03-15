return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      -- Get the current lualine configuration
      local lualine_opts = opts or {}
      
      -- Add searchcount to the lualine_x section
      table.insert(lualine_opts.sections.lualine_x, 1, {
        "searchcount",
      })
      
      -- Add selectioncount to the lualine_x section
      table.insert(lualine_opts.sections.lualine_x, 1, {
        "selectioncount",
      })
      
      return lualine_opts
    end,
}
  