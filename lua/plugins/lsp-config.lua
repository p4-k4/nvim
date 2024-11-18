return {
  {
    "nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      diagnostics = {
        virtual_text = false,
      },
      servers = {
        tailwindcss = {
          filetypes = { "html", "elixir", "eex", "heex", "surface" },
          init_options = {
            userLanguages = {
              elixir = "phoenix-heex",
              heex = "phoenix-heex",
              eex = "phoenix-heex",
            },
          },
        },
      },
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = {
              'class[:]\\s*"([^"]*)"',
            },
          },
        },
      },
    },
  },
}
