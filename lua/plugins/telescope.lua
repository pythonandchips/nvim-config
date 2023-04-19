return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    cmd = 'Telescope',
    keys = {
      { '<leader>f', '<cmd>Telescope find_files<cr>', desc = 'Find Files (cwd)' },
      { '<leader>b', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
      { '<leader>c', '<cmd>Telescope git_commits<cr>', desc = 'Git Commits' },
      { '<leader>s', '<cmd>Telescope git_status<cr>', desc = 'Git Commits' },
      { '<leader>ff', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
      { '<leader>fw', '<cmd>Telescope grep_string<cr>', desc = 'Live Grep word under cursor' }
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  'otavioschwanck/telescope-alternate.nvim'
}
