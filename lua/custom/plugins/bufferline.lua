return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('bufferline').setup {
      options = {
        diagnostics = 'nvim_lsp',
        show_buffer_close_icons = true,
        show_close_icon = true,
        separator_style = 'slant',
      },
    }
    vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>', { silent = true })
    vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>', { silent = true })
    vim.keymap.set('n', 'bd', ':bdelete<CR>', { silent = true })
  end,
}
