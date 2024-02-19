local lsp = require("lsp-zero")
local builtin = require("telescope.builtin")

lsp.preset("recommended")

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
  })
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(_, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", 'gi', builtin.lsp_implementations, opts)
  vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
  vim.keymap.set("n", 'gr', builtin.lsp_references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "dl", builtin.diagnostics, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'

if not configs.golangcilsp then
  configs.golangcilsp = {
    default_config = {
      cmd = {'golangci-lint-langserver'},
      root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
      init_options = {
        command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json", "--issues-exit-code=1" };
      }
    };
  }
end
lspconfig.golangci_lint_ls.setup {
  filetypes = {'go','gomod'}
}

vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", { silent = true })


local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", 'gi', builtin.lsp_implementations, opts)
  vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
  vim.keymap.set("n", 'gr', builtin.lsp_references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "dl", builtin.diagnostics, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'eslint',
    'rust_analyzer',
    'gopls',
    'pyright',
    'html',
  },
  handlers = {
    lsp_zero.default_setup,
  }
})

