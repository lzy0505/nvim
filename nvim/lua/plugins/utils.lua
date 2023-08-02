return {
    {
        "folke/persistence.nvim",
        keys = {
            { "<leader>qs", function() require("persistence").load() end, desc = "???" },
            { "<leader>ql", function() require("persistence").load({ last = true}) end , desc = "???" },
            { "<leader>qd", function() require("persistence").stop() end , desc = "???" },
        },
        config = function()
            require("persistence").setup()
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            triggers_blacklist = {
                i = { "j", "k" },
                v = { "j", "k" },
                c = { " " },
            },
        },
        config = function()
            require("which-key").register({
                ["<leader>f"] = {name = "+[F]ile"},
                ["<leader>b"] = {name = "+[B]uffer"},
                ["<leader>w"] = {name = "+[W]indow"},
                ["<leader>p"] = {name = "+[P]roject"},
                ["<leader>j"] = {name = "+[J]ump"},
                ["<leader>d"] = {name = "+[D]ebug"},
                ["<leader>g"] = {name = "+[G]oto"},
            })
        end
    }
}
