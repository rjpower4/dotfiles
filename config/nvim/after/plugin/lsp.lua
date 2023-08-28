local mason = require("mason")

require("fidget").setup({})
require("neodev").setup({})

local on_attach = function(_, buffnr)
	vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, {})
	vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "[L]SP [F]ormat" })
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, { desc = "[G]o to type [D]efinition" })
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]o to [D]efinition" })
	vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "[G]o to [I]mplementation" })

	vim.keymap.set(
		"n",
		"<leader>pS",
		require("telescope.builtin").lsp_document_symbols,
		{ desc = "[D]ocument [S]ymbols" }
	)
	vim.keymap.set(
		"n",
		"<leader>pw",
		require("telescope.builtin").lsp_document_symbols,
		{ desc = "[D]ocument [S]ymbols" }
	)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

mason.setup({})
require("lspconfig").clangd.setup({ on_attach = on_attach })
require("lspconfig").gopls.setup({ on_attach = on_attach })
require("lspconfig").rust_analyzer.setup({ on_attach = on_attach })
require("lspconfig").lua_ls.setup({ on_attach = on_attach })
require("lspconfig").ocamllsp.setup({ on_attach = on_attach })
require("lspconfig").julials.setup({ on_attach = on_attach })
