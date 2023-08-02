-- LSP completion with cmp
return {
    "hrsh7th/nvim-cmp",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
    },
    config = function()
        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end
        local cmp = require 'cmp'
        cmp.setup {
            -- snippet = ,
            sources = cmp.config.sources {
                { name = 'nvim_lsp' },
                { name = 'path' },
                { name = "buffer" },
            },
            -- shortcuts when the prompt window shows up
            mapping = cmp.mapping.preset.insert {
                -- Tab to switch between items
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                -- Return to confirm
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            },
            experimental = {
                ghost_text = true,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
        }

        -- completion for lookup
        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' },
            }
        })

        -- completion for command
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' },
                { name = 'cmdline' }
            })
        })
    end,
}
