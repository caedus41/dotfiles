--local catpuccin_config = {
    --"catppuccin/nvim",
    --name = "catppuccin",
    --priority = 1000,
    --config=function()
        --vim.cmd.colorscheme "catppuccin-frappe"
    --end
--}

return {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000,
    config=function()
        vim.cmd.colorscheme "kanagawa-wave"
    end
}
