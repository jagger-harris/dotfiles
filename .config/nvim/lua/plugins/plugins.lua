-- Installs packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

return require("packer").startup(function(use)
	-- Dependencies
	use "wbthomason/packer.nvim"
	use "nvim-lua/popup.nvim"
	use "nvim-lua/plenary.nvim"

	-- Misc
	use "nvim-telescope/telescope.nvim" -- Fuzzy finder
	use "windwp/nvim-autopairs" -- Autopairs {}, (), etc.
	use "numToStr/Comment.nvim" -- Comment and uncomment quickly
	use "lewis6991/gitsigns.nvim" -- Git integration
	use "akinsho/toggleterm.nvim" -- Better terminal integration
	use "ahmedkhalf/project.nvim" -- Project manager for telescope
	use "lewis6991/impatient.nvim" -- Load plugins faster
	use "lukas-reineke/indent-blankline.nvim" -- Connecting lines between functions, ifs, etc.
	use "norcalli/nvim-colorizer.lua" -- Produces colors in hex color values
	use "kyazdani42/nvim-web-devicons" -- Icons
  use {
		"goolord/alpha-nvim", -- Main menu if no file is open
	  requires = {
			"BlakeJC94/alpha-nvim-fortune"
		}
	}
	use {
		"kyazdani42/nvim-tree.lua", -- File tree explorer
	}
	use {
		"akinsho/bufferline.nvim", -- Better buffer lines
		tag = "v2.*",
	}
	use {
		"nvim-lualine/lualine.nvim", -- Bottom status bar
	}

	-- Colorscheme
	use "navarasu/onedark.nvim"

	-- LSP
	use "neovim/nvim-lspconfig"
	use "williamboman/nvim-lsp-installer"
  use "RRethy/vim-illuminate"

	-- CMP
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "hrsh7th/cmp-nvim-lsp"
	use "saadparwaiz1/cmp_luasnip"

  -- Debugger
  use "mfussenegger/nvim-dap"
  use "ravenxrz/DAPInstall.nvim"
  use {
    "rcarriga/nvim-dap-ui",
    requires = {"mfussenegger/nvim-dap"}
  }

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdateSync"
	}
	use "p00f/nvim-ts-rainbow"
	use "JoosepAlviste/nvim-ts-context-commentstring"

  -- C/C++
  use "drmikehenry/vim-headerguard"

  -- Formmater
  use "mhartington/formatter.nvim"

	-- Snippets
	use "L3MON4D3/LuaSnip"
	use "rafamadriz/friendly-snippets"

  if packer_bootstrap then
    require("packer").sync()
  end
end)
