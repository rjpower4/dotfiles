return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-context",
			"nvim-treesitter/playground",
		},
		build = ":TSUpdate",
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = false,
				theme = "zenbones",
				component_separators = "|",
				section_separators = "",
			},
		},
	},
	{ "mbbill/undotree" },
	{
		"mcchrish/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
	},
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
    {
        "akinsho/toggleterm.nvim", 
        config = true,
    }
}
