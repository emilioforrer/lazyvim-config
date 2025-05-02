-- https://github.com/yetone/avante.nvim/blob/main/lua/avante/config.lua
return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    enable = true,
    version = false,
    opts = {
        -- Main AI provider to use
        provider = "copilot",  -- Options include: "copilot", "ollama", etc.
        auto_suggestions_provider = "copilot",
        
        -- Whether to use XML format for responses
        use_xml_format = false,
        
        -- Copilot-specific settings
        copilot = {},
        
        -- file_selector = "telescope",  -- Options: "telescope", "mini.pick", "fzf"
        -- window = {
        --   position = "right",  -- Options: "left", "right", "top", "bottom"
        --   width = 50,          -- Width in columns when position is left/right
        --   height = 15,         -- Height in rows when position is top/bottom
        -- },
        -- model = "gpt-4",      -- Default model to use
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }