return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = true, -- Highlight current file
        use_libuv_file_watcher = true, -- Auto-update tree when files change
      },
      window = {
        mappings = {
          ['l'] = 'open', -- Set 'l' to open files
          ['h'] = 'close_node', -- Collapse folders with 'h'
          ['<CR>'] = 'open',
        },
      },
    }

    -- Set keymap to open Neo-tree with <Leader> + e
    vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })
  end,
}
