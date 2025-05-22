local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
    use { "wbthomason/packer.nvim"} -- Have packer manage itself
    use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins
    use { "windwp/nvim-autopairs" } -- Autopairs, integrates with both cmp and treesitter
    use { "numToStr/Comment.nvim" }
    use { "JoosepAlviste/nvim-ts-context-commentstring" }
    use { "kyazdani42/nvim-web-devicons" }
    use { "kyazdani42/nvim-tree.lua" }
    use { "akinsho/bufferline.nvim" }
    use { "moll/vim-bbye" }
    use { "nvim-lualine/lualine.nvim" }
    use { "akinsho/toggleterm.nvim" }
    use { "ahmedkhalf/project.nvim" }
    use { "lewis6991/impatient.nvim" }
    use { "lukas-reineke/indent-blankline.nvim", main="ibl", opts={} }
    use { "goolord/alpha-nvim" }
    use {"folke/which-key.nvim"}

	-- Colorschemes
    use { "folke/tokyonight.nvim" }
    use { "lunarvim/darkplus.nvim" }

	-- Cmp 
    use { "hrsh7th/nvim-cmp" } -- The completion plugin
    use { "hrsh7th/cmp-buffer" } -- buffer completions
    use { "hrsh7th/cmp-path" } -- path completions
    use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-nvim-lua" }

	-- Snippets
    use { "L3MON4D3/LuaSnip" } --snippet engine
    use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

	-- LSP
    use { "neovim/nvim-lspconfig" } -- enable LSP
    use { "williamboman/mason.nvim" } -- simple to use language server installer
    use { "williamboman/mason-lspconfig.nvim" }
    use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
    use { "RRethy/vim-illuminate" }

	-- Telescope
    use { "nvim-telescope/telescope.nvim" }

	-- Treesitter
    use { "nvim-treesitter/nvim-treesitter" }

	-- Git
    use { "lewis6991/gitsigns.nvim" }

    -- leap
    --    use { "ggandor/leap.nvim"}

    -- symbols-outline
    use {"simrat39/symbols-outline.nvim"}

    -- trailblazer.nvim --
    use{ "LeonHeidelbach/trailblazer.nvim",
        config = function()
            require("trailblazer").setup({
                -- your custom config goes here
            }) end,}

    use {
    "danymat/neogen",
    config = function()
        require('neogen').setup {}
    end,
    -- Uncomment next line if you want to follow only stable versions
    -- tag = "*"
    }

    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })


    use {
        'smoka7/hop.nvim',
         tag = '*', -- optional but strongly recommended
         config = function()
            -- you can configure Hop the way you like here; see :h hop-config
         require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
         end
    }

    -- nvim-treesitter-textobjects --
    -- use{
    --   "nvim-treesitter/nvim-treesitter-textobjects",
    --   after = "nvim-treesitter",
    --   requires = "nvim-treesitter/nvim-treesitter",
    -- }

    -- nvim-treesitter-textsubjects --
    -- use{
    --     "RRethy/nvim-treesitter-textsubjects", 
    --     lazy = true,
    --     event = { "User FileOpened" },
    --     after = "nvim-treesitter",
    --     dependencies = { "nvim-treesitter/nvim-treesitter" },
    --     config = function()
    --         require("nvim-treesitter.configs").setup({
    --             textsubjects = {
    --                 enable = true,
    --                 prev_selection = ",",
    --                 keymaps = {
    --                     ["."] = "textsubjects-smart",
    --                     [";"] = "textsubjects-container-outer",
    --                     ["i;"] = "textsubjects-container-inner",
    --                 },
    --             },
    --         })
    --     end,
    -- }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
