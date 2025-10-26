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

				-- Show diagnostics in quickfix
				map("n", "<leader>dq", function()
					vim.diagnostic.setqflist()
					-- Open in Telescope if available
					vim.defer_fn(function()
						if #vim.fn.getqflist() > 0 then
							require("telescope.builtin").quickfix()
						else
							vim.notify("No diagnostics found", vim.log.levels.INFO)
						end
					end, 100)
				end, opts)
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

			-- Setup LSP servers using vim.lsp.config (Nvim 0.11+)
			-- This replaces the deprecated require('lspconfig').server.setup() pattern

			-- Configure on_attach for all servers
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client then
						on_attach(client, bufnr)
					end
				end,
			})

			-- Lua
			vim.lsp.config("lua_ls", {
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
			vim.lsp.config("gopls", {
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
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
			})

			-- HTML
			vim.lsp.config("html", {
				capabilities = capabilities,
			})

			-- CSS
			vim.lsp.config("cssls", {
				capabilities = capabilities,
			})

			-- JSON
			vim.lsp.config("jsonls", {
				capabilities = capabilities,
			})

			-- YAML
			vim.lsp.config("yamlls", {
				capabilities = capabilities,
			})

			-- Bash
			vim.lsp.config("bashls", {
				capabilities = capabilities,
			})

			-- Python
			vim.lsp.config("pyright", {
				capabilities = capabilities,
			})

			-- Enable all configured servers
			local servers = { "lua_ls", "gopls", "ts_ls", "html", "cssls", "jsonls", "yamlls", "bashls", "pyright" }
			for _, server in ipairs(servers) do
				vim.lsp.enable(server)
			end
		end,
	},
}

