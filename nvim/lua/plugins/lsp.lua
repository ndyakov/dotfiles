return {
	-- LSP Configuration
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			-- Mason: LSP server installer
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			{ "j-hui/fidget.nvim", opts = {} },

			-- Additional lua configuration for neovim
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			-- Setup mason
			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			-- Setup mason-lspconfig
			require("mason-lspconfig").setup({
				ensure_installed = {
					"gopls", -- Go
					"lua_ls", -- Lua
					"ts_ls", -- TypeScript/JavaScript
					"html", -- HTML
					"cssls", -- CSS
					"jsonls", -- JSON
					"yamlls", -- YAML
					"bashls", -- Bash
					"pyright", -- Python
				},
				automatic_installation = true,
			})

			-- LSP keymaps (set when LSP attaches to buffer)
			local on_attach = function(client, bufnr)
				local opts = { buffer = bufnr, noremap = true, silent = true }
				local map = vim.keymap.set

				-- Go to definition
				map("n", "gd", vim.lsp.buf.definition, opts)

				-- Go to declaration
				map("n", "gD", vim.lsp.buf.declaration, opts)

				-- Go to implementation
				map("n", "gi", vim.lsp.buf.implementation, opts)

				-- Go to type definition
				map("n", "gt", vim.lsp.buf.type_definition, opts)

				-- Find references
				map("n", "gr", vim.lsp.buf.references, opts)

				-- Hover documentation
				map("n", "K", vim.lsp.buf.hover, opts)

				-- Signature help
				map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				map("i", "<C-k>", vim.lsp.buf.signature_help, opts)

				-- Rename symbol
				map("n", "<leader>rn", vim.lsp.buf.rename, opts)

				-- Code action
				map("n", "<leader>ca", vim.lsp.buf.code_action, opts)

				-- Format buffer
				map("n", "<leader>fm", function()
					vim.lsp.buf.format({ async = true })
				end, opts)

				-- Diagnostics
				map("n", "[d", vim.diagnostic.goto_prev, opts)
				map("n", "]d", vim.diagnostic.goto_next, opts)
				map("n", "<leader>e", vim.diagnostic.open_float, opts)
				map("n", "<leader>dl", vim.diagnostic.setloclist, opts)
			end

			-- Get capabilities from nvim-cmp
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Configure diagnostic signs
			local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			-- Configure diagnostics
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				update_in_insert = false,
				underline = true,
				severity_sort = true,
				float = {
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			-- Configure LSP handlers
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "rounded",
			})

			-- Setup LSP servers
			local lspconfig = require("lspconfig")

			-- Lua
			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})

			-- Go
			lspconfig.gopls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						gofumpt = true,
					},
				},
			})

			-- TypeScript/JavaScript
			lspconfig.ts_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- HTML
			lspconfig.html.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- CSS
			lspconfig.cssls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- JSON
			lspconfig.jsonls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- YAML
			lspconfig.yamlls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- Bash
			lspconfig.bashls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- Python
			lspconfig.pyright.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end,
	},
}

