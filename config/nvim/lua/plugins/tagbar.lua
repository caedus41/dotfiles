return {
    "preservim/tagbar",
    config=function ()
       vim.keymap.set('n', '<C-m>', ':TagbarToggle<CR>', {})
    end
}
