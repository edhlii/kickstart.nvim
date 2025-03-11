return {
  'folke/tokyonight.nvim',
  priority = 1000,
  config = function()
    require('tokyonight').setup {
      style = 'moon', -- Options: night, storm, moon, day
      transparent = false, -- Enable transparent background
      terminal_colors = true,
    }
    vim.cmd [[colorscheme tokyonight]]
  end,
}
