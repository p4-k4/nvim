return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/config/snippets/" })
      require("luasnip").setup({
        history = true,
        update_events = "TextChanged,TextChangedI",
      })
    end,
  },
}
