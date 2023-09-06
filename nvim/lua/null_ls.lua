require("mason-null-ls").setup({
	ensure_installed = {
		"prettierd",
		"stylua",
		"goimports",
		"golines",
		"eslint_d",
	},
	automatic_installation = false,
})

local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		formatting.prettierd.with({
			filetypes = { "html", "svelte", "markdown", "css", "javascript", "javascriptreact" },
			env = {
				PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/.prettierrc.cjs"),
			},
		}),
		formatting.stylua,
		formatting.goimports,
		formatting.golines,
		diagnostics.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file(".eslintrc.cjs")
			end,
		}),
	},
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
