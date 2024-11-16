-- ~/.config/nvim/lua/snippets/dart.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

-- Explicitly add snippets to the dart filetype
ls.add_snippets("dart", {
  s(
    "scf",
    fmt(
      [[
class {}View extends StatelessWidget {{
  const {}View({{super.key}});
  @override
  Widget build(BuildContext context) {{
    return Scaffold(
      appBar: AppBar(
        title: const Text('{}'),
      ),{}
    );
  }}
}}]],
      {
        i(1, "Home"),
        rep(1),
        i(2, "Home"),
        i(3, ""),
      }
    )
  ),
})

-- Return an empty table since we're using add_snippets directly
return {}
