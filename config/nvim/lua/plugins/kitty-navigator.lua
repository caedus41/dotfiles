function setupKittyNav() 
    vim.cmd("nnoremap <C-J> :KittyNavigateDown<cr>")
    vim.cmd("nnoremap <C-K> :KittyNavigateUp<cr>")
    vim.cmd("nnoremap <C-L> :KittyNavigateRight<cr>")
    vim.cmd("nnoremap <C-H> :KittyNavigateLeft<cr>")
end

return {
    "knubie/vim-kitty-navigator",
    build = "cp ./*.py ~/.config/kitty/",
    config=setupKittyNav
}
