return {
  -- Suporte para Templ
  {
    "joerdav/templ.vim",
    ft = "templ",
  },

  -- Configurar Treesitter para Templ
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "templ",
        "html",
        "css",
        "javascript",
      })
    end,
  },
}
