local fn = vim.fn

-- Auto packer compile
vim.cmd([[
	augroup packer_user_config
		autocmd!
    	autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]])

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

return require("packer").startup(
    function(use)
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
		use {
			"goolord/alpha-nvim", -- Main menu if no file is open
			requires = {
				"BlakeJC94/alpha-nvim-fortune"
			}
		}
		use {
			"kyazdani42/nvim-tree.lua", -- File tree explorer
			requires = {
				"kyazdani42/nvim-web-devicons"
			}
		}
		use {
			"akinsho/bufferline.nvim", -- Better buffer lines
			tag = "v2.*",
			requires = {
				"kyazdani42/nvim-web-devicons"
			}
		}
		use {
			"nvim-lualine/lualine.nvim", -- Bottom status bar
			requires = {
				"kyazdani42/nvim-web-devicons"
			}
		}

		-- Colorscheme
		use "navarasu/onedark.nvim"

		-- LSP
		use "neovim/nvim-lspconfig"
		use "williamboman/nvim-lsp-installer"

		-- CMP
		use "hrsh7th/nvim-cmp"
		use "hrsh7th/cmp-buffer"
		use "hrsh7th/cmp-path"
		use "hrsh7th/cmp-cmdline"
		use "hrsh7th/cmp-nvim-lsp"
		use "saadparwaiz1/cmp_luasnip"

		-- Treesitter
		use {
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdateSync"
		}
		use "p00f/nvim-ts-rainbow"
		use "JoosepAlviste/nvim-ts-context-commentstring"

		-- Snippets
		use "L3MON4D3/LuaSnip"
		use "rafamadriz/friendly-snippets"

        if PACKER_BOOTSTRAP then
            require("packer").sync()
        end
    end
)

