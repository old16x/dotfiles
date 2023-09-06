local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use({
		"wbthomason/packer.nvim",
		commit = "1d0cf98a561f7fd654c970c49f917d74fafe1530",
	})

	use({
		"projekt0n/github-nvim-theme",
		commit = "af07dda03f6c7184bfd2cb0c9de4efebb26241d6",
		config = function()
			require("github-theme").setup()
			vim.cmd("colorscheme github_dark_dimmed")
		end,
	})

	use({
		"moll/vim-bbye",
		commit = "25ef93ac5a87526111f43e5110675032dbcacf56",
	})

	use({
		"szw/vim-maximizer",
		commit = "2e54952fe91e140a2e69f35f22131219fcd9c5f1",
	})

	use({
		"cohama/lexima.vim",
		commit = "36781e59099b9b46eed564283b95938f90cd852d",
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		commit = "3ad57e569d1c47cf4fa2308f555003e0a5509204",
	})

	use({
		"numToStr/Comment.nvim",
		commit = "0236521ea582747b58869cb72f70ccfa967d2e89",
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "31f608e47b838594d32a7bc42028e2cefd0ddaad",
		run = ":TSUpdate",
	})

	use({
		"neovim/nvim-lspconfig",
		commit = "4dc7011886739e63653eaf6ae3acef7c22548602",
		requires = {
			{
				"williamboman/mason.nvim",
				commit = "a51c2d063c5377ee9e58c5f9cda7c7436787be72",
			},
			{
				"williamboman/mason-lspconfig.nvim",
				commit = "2997f467881ac4faa6f8c5e7065e3a672297c8ad",
			},
			{
				"nvim-lua/plenary.nvim",
				commit = "0dbe561ae023f02c2fb772b879e905055b939ce3",
			},
			{
				"jay-babu/mason-null-ls.nvim",
				commit = "ae0c5fa57468ac65617f1bf821ba0c3a1e251f0c",
			},
			{
				"jose-elias-alvarez/null-ls.nvim",
				commit = "e45670abdcda293282b7a00d0e2f7d473e7d6251",
			},
		},
	})

	use({
		"hrsh7th/nvim-cmp",
		commit = "51f1e11a89ec701221877532ee1a23557d291dd5",
		requires = {
			{
				"L3MON4D3/LuaSnip",
				commit = "c4d6298347f7707e9757351b2ee03d0c00da5c20",
			},
			{
				"saadparwaiz1/cmp_luasnip",
				commit = "18095520391186d634a0045dacaa346291096566",
			},
			{
				"hrsh7th/cmp-nvim-lsp",
				commit = "44b16d11215dce86f253ce0c30949813c0a90765",
			},
		},
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
