local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

map("", "<leader>e", ":Explore . <CR>", default_opts)
map("", "<leader>E", ":Explore <CR>", default_opts)
map("", "<C-H>", "<C-W>h", default_opts)
map("", "<C-J>", "<C-W>j", default_opts)
map("", "<C-K>", "<C-W>k", default_opts)
map("", "<C-L>", "<C-W>l", default_opts)
map("", "<C-c>", "<cmd>nohl<CR>", default_opts)
