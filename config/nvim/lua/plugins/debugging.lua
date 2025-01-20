return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
        -- TODO: Need to install language specific adapaters and enable them

        vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
        vim.keymap.set("n", "<Leader>dc", dap.continue, {})
    end,
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio"
    },
}
