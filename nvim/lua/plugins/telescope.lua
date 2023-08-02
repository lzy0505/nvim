return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make'
        },
    },
    keys = {
        { '<leader>ff', function() return require('telescope.builtin').find_files() end, desc = "[F]ile" },
        { '<leader>fg', function() return require('telescope.builtin').live_grep end, desc = "[G]rep" },
        { "<leader>bb", function() return require('telescope.builtin').buffers end, desc = "[B]uffers" },
        { '<leader>fr', function() return require('telescope.builtin').oldfiles end, desc = "[R]ecents" },
        { '<leader>fs', function()
            require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, desc = "[S]earch" },
    },
    config = function ()
        require('telescope').setup{
          defaults = {
            -- Default configuration for telescope goes here:
            -- config_key = value,
            mappings = {
              i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key"
              }
            }
          },
          pickers = {
            -- Default configuration for builtin pickers goes here:
            -- picker_name = {
            --   picker_config_key = value,
            --   ...
            -- }
            -- Now the picker_config_key will be applied every time you call this
            -- builtin picker
          },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case"
                }
            }
        }
        require("telescope").load_extension('fzf')
    end
}
