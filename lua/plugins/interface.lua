return {
  {
    {
      'simnalamburt/vim-mundo',
      keys = {
        { '<F5>', ':MundoToggle<CR>', desc = 'Toggle Mundo' }
      }
    },
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    opts = {
      options = {
        theme = 'catppuccin'
      }
    }
  },
  { "catppuccin/nvim", name = "catppuccin" },
}
