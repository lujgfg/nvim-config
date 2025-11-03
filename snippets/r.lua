-- snippets/r.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("fun", {
    t("function("), i(1, "x"), t(") {"), t({"", "  "}),
    i(2, "# code"), t({"", "}"}),
  }),
  s("lib", {
    t("library("), i(1, "dplyr"), t(")")
  }),
  s("pipe", { t("%>%") }),
}
