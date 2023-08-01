return {
  -- add symbols-outline
  {
    "whonore/Coqtail",
    -- cmd = "SymbolsOutline",
    keys = {
           -- { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" }
        },
    opts = {
      -- add your options that should be passed to the setup() function here
      -- position = "right",
    },
    config = function ()
            vim.g.coqtail_auto_set_proof_diffs = 'on'
        end
  },
}
