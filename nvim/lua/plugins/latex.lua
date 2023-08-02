return {
  {
    "lervag/vimtex",
    -- cmd = "SymbolsOutline",
    keys = {},
    opts = {
      -- add your options that should be passed to the setup() function here
      position = "right",
    },
    config = function ()
        vim.g.vimtex_view_method = 'Skim'

        -- VimTeX uses latexmk as the default compiler backend. If you use it, which is
        -- strongly recommended, you probably don't need to configure anything. If you
        -- want another compiler backend, you can change it as follows. The list of
        -- supported backends and further explanation is provided in the documentation,
        -- see ":help vimtex-compiler".
        -- vim.g.vimtex_compiler_method = 'latexmk'

        -- Most VimTeX mappings rely on localleader
    end
  },
}
