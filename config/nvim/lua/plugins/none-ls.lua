return {
    "nvimtools/none-ls.nvim",
    dependencies={
        "neovim/nvim-lspconfig"
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            debug=true,
            sources = {
                null_ls.builtins.formatting.stylua,
            },
        })
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        vim.cmd([[autocmd BufWritePost * :lua vim.notify(vim.inspect(require("null-ls").get_sources()))]])

    end,
}
