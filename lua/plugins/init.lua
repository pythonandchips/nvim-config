return {
  --
  -- TreeSitter
  --
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'bash',
        'json',
        'javascript',
        'typescript',
        'lua',
        'markdown',
        'ruby',
        'sql',
        'yaml',
        'vim',
      },
      highlight = {
        enable = true,  -- Enable syntax highlighting for everything
      },
      autopairs = {
        enable = true
      },
      endwise = {
        enable = true,
      },
      indent = { enable = true }
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
    dependencies = {
      "windwp/nvim-autopairs",
      "RRethy/nvim-treesitter-endwise"
    }
  },
  'nvim-treesitter/playground'
}
