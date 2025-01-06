return {
    {
        "williamboman/mason.nvim",
        config=function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy=false,
        opts = {
            auto_install=true
        }
    },
    {
        "neovim/nvim-lspconfig",
        config=function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({ capabilities = capabilities })

            lspconfig.pyright.setup({
              capabilities = capabilities,
              settings = {
                  pyright = {
                      -- Using Ruff's import organizer
                      disableOrganizeImports = true,
                  },
                  python = {
                      analysis = {
                      -- Ignore all files for analysis to exclusively use Ruff for linting
                          ignore = { "*" },
                      },
                  },
              },
            })
            lspconfig.ruff.setup({
              trace = 'messages',
              init_options = {
                settings = {
                  logLevel = 'debug',
                }
              }
            })

            lspconfig.terraformls.setup({ capabilities = capabilities })
            lspconfig.tflint.setup({ capabilities = capabilities })

            vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, {})
            vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, {})
            vim.keymap.set({'n'}, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    },
}
