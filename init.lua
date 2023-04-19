local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","
vim.g.maplocalleader = ","

require('keyboard')
require('settings')
require('lazy').setup('plugins')
require('lualine').setup()

vim.cmd.colorscheme "catppuccin-mocha"

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})

require('nvim-highlight-colors').setup {}

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

require('telescope').setup{
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    ["telescope-alternate"] = {
      mappings = {
        { pattern = 'app/models/(.*).rb',
          targets = {
            { template = 'spec/models/[1]_spec.rb', label = 'Spec' },
            { template = 'app/controllers/[1:pluralize]_controller.rb', label = 'Controller' },
            { template = 'app/views/[1:pluralize]/*.html.erb', label = 'Views' }
          }
        },
        { pattern = 'app/controllers/(.*)_controller.rb',
          targets = {
            { template = 'spec/controllers/[1]_controller_spec.rb', label = 'Spec' },
            { template = 'spec/requests/[1]_controller_spec.rb', label = 'Spec' },
            { template = 'app/models/[1:singularize].rb', label = 'model' },
            { template = 'app/views/[1]/*.html.erb', label = 'Views' },
            { template = 'app/helpers/[1]_helper.rb', label = 'Helper' }
          }
        },
      },
    },
  },
}

require('autopairs')

