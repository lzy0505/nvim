-- dap for debugging
return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim",
        "mfussenegger/nvim-dap-python",
    },
    keys = {
        -- TODO add to which keys
        { '<F2>',     function() require('dap').step_over() end },
        { '<F3>',     function() require('dap').step_into() end },
        { '<S-F3>',     function() require('dap').step_out() end },
        { '<leader>df',      function() require 'telescope'.extensions.dap.configurations {} end },
        { '<leader>db', function() require('dap').toggle_breakpoint() end },
        { '<leader>dB', function() require('dap').set_breakpoint() end },
        { '<leader>dl', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end },
        { '<leader>dr', function() require('dap').repl.open() end },
        { '<leader>dL', function() require('dap').run_last() end },
        { '<leader>dh',
            function() require('dap.ui.widgets').hover() end,
            mode = { 'n', 'v' }
        },
        { '<leader>dp',
            function() require('dap.ui.widgets').preview() end,
            mode = { 'n', 'v' }
        },
        { '<leader>dF', function()
            local widgets = require('dap.ui.widgets')
            widgets.centered_float(widgets.frames)
        end },
        { '<leader>dS', function()
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
        dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
        dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
        dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
    end
}
