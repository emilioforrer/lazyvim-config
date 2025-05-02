return {
  'augmentcode/augment.vim',
  enabled = true,
  config = function()
    -- Disable the default Tab mapping if you want to use Tab for something else
    -- vim.g.augment_disable_tab_mapping = 1
    
    -- Customize Node.js command if needed
    -- vim.g.augment_node_command = 'node16'
    
    -- Or set a custom job command
    -- vim.g.augment_job_command = {'path/to/custom/node', 'path/to/augment/script'}
  end,
}
