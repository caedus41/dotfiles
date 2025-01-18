local function git_root_finder()
    local builtin = require("telescope.builtin")
    local utils = require("telescope.utils")
	local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
	if vim.v.shell_error == 0 then
		builtin.find_files({ cwd = root })
	else
		builtin.find_files({cwd=utils.buffer_dir()})
	end
end

local config = {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
            local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-f>", git_root_finder, { desc = "Telescope find files" })
            -- Make sure to install ripgrep for this to work! 
			vim.keymap.set("n", "<C-g>", builtin.grep_string, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<C-b>", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>th", builtin.help_tags, { desc = "Telescope help tags" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}

return config
