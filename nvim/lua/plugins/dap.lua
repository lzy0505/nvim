return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim",
        "mfussenegger/nvim-dap-python",
    },
    keys = {
        { '<Leader>df',      function() require 'telescope'.extensions.dap.configurations {} end },
        { '<F8>',     function() require('dap').step_over() end },
        { '<F7>',     function() require('dap').step_into() end },
        { '<S-F8>',     function() require('dap').step_out() end },
        { '<Leader>db', function() require('dap').toggle_breakpoint() end },
        { '<Leader>dB', function() require('dap').set_breakpoint() end },
        { '<Leader>dl',
            function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end },
        { '<Leader>dr', function() require('dap').repl.open() end },
        { '<Leader>dL', function() require('dap').run_last() end },
        {
            '<Leader>dh',
            function()
                require('dap.ui.widgets').hover()
            end,
            mode = { 'n', 'v' }
        },
        {
            '<Leader>dp',
            function()
                require('dap.ui.widgets').preview()
            end,
            mode = { 'n', 'v' }
        },
        { '<Leader>dF', function()
            local widgets = require('dap.ui.widgets')
            widgets.centered_float(widgets.frames)
        end },
        { '<Leader>dS', function()
            local widgets = require('dap.ui.widgets')
            widgets.centered_float(widgets.scopes)
        end },
    },
    config = function()

        -- should run 'pip3 install debugpy' at first
        require('dap-python').setup('python3')
        require('telescope').load_extension('dap')
        local dap, dapui = require("dap"), require("dapui")
        require("nvim-dap-virtual-text").setup()
        require("dapui").setup()
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
    end
}

-- .nvim.lua should be configured like:
-- dap.adapters.debugpy = {
    -- type = 'executable',
    -- command = 'python',
    -- args = {'-m', 'debugpy.adapter'}
-- }
-- dap.configurations.python = {
    -- {
        -- type = 'debugpy',
        -- request = 'launch',
        -- name = 'debug files',
        -- program = '${file}',
    -- },
-- }
