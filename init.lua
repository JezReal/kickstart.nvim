--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================

Kickstart.nvim is *not* a distribution.

Kickstart.nvim is a template for your own configuration.
  The goal is that you can read every line of code, top-to-bottom, understand
  what your configuration is doing, and modify it to suit your needs.

  Once you've done that, you should start exploring, configuring and tinkering to
  explore Neovim!

  If you don't know anything about Lua, I recommend taking some time to read through
  a guide. One possible example:
  - https://learnxinyminutes.com/docs/lua/


  And then you can explore or search through `:help lua-guide`
  - https://neovim.io/doc/user/lua-guide.html


Kickstart Guide:

I have left several `:help X` comments throughout the init.lua
You should run that command and read that help section for more information.

In addition, I have some `NOTE:` items throughout the file.
These are for you, the reader to help understand what is happening. Feel free to delete
them once you know what you're doing, but they should serve as a guide for when you
are first encountering a few different constructs in your nvim config.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>e', vim.cmd.Ex)
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.clipboard = 'unnamedplus'
vim.o.undofile = true

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
	{
		'nvim-telescope/telescope.nvim', tag='0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{   
		'olivercederborg/poimandres.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('poimandres').setup {
				-- leave this setup function empty for default config
				-- or refer to the configuration section
				-- for configuration options
			}
		end,

		-- optionally set the colorscheme within lazy config
		init = function()
			vim.cmd("colorscheme poimandres")
		end
	},
	{
		"nvim-treesitter/nvim-treesitter", 
		build = ":TSUpdate",
		config = function () 
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {"help", "lua", "vim", "vimdoc", "javascript", "typescript", "html", "go" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },  
			})
		end
	},
	{
		"ThePrimeagen/harpoon",
	},
	{
		'mbbill/undotree'
	},
	{
		'tpope/vim-fugitive'
	},
}, {})

-- Telescope config
local builtin = require('telescope/builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>gs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)


-- Harpoon config
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

vim.keymap.set('n', '<C-h>', function() ui.nav_file(1) end)
vim.keymap.set('n', '<C-j>', function() ui.nav_file(2) end)
vim.keymap.set('n', '<C-k>', function() ui.nav_file(3) end)
vim.keymap.set('n', '<C-l>', function() ui.nav_file(4) end)


-- Undo tree config
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Fugitive config
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
