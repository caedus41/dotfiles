function bindNeoTree()
    local current_buf = vim.api.nvim_get_current_buf()
    local current_buf_name = vim.api.nvim_buf_get_name(current_buf)

    -- If we're in Neo-tree, go back to previous window
    if current_buf_name:match("neo%-tree filesystem") then
        vim.cmd("wincmd p")
        return
    end

    local neotree_win = nil
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local buf_name = vim.api.nvim_buf_get_name(buf)
        if buf_name:match("neo%-tree filesystem") then
            neotree_win = win
            break
        end
    end

    if neotree_win then
        vim.api.nvim_set_current_win(neotree_win)
    else
        vim.cmd("Neotree reveal_force_cwd toggle=true filesystem reveal=true position=left")
    end
end


local function neoTreeSetup()
    vim.keymap.set(
        'n',
        '<C-n>',
        bindNeoTree,
        { desc = 'Toggle Neo-Tree, focus if open, return if in Neo-tree' })

    require("neo-tree").setup({
      window = {
        mappings = {
          ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
          ["v"] = { "open_vsplit" },
          ["s"] = { "open_split" },
          ["u"] = { "navigate_up" },
        }
      }
    })
end

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = neoTreeSetup
}
