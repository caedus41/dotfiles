return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = {
            "git_config",
            "git_rebase",
            "go",
            "hcl",
            "html",
            "ini",
            "javascript",
            "jq",
            "json",
            "json5",
            "lua",
            "nginx",
            "python",
            "query",
            "regex",
            "terraform",
            "vim",
            "vimdoc",
            "yaml"
        },
        sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
 }
