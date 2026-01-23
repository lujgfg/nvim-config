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
  s("fil", { t("dplyr::filter("), i(1, "x"), t(")") }),
  s("sel", { t("dplyr::select("), i(1, "x"), t(")") }),
  s("mut", { t("dplyr::mutate("), i(1, "x"), t(")") }),
  s("acr", { t("dplyr::across("), i(1, "x"), t(")") }),
  s("match", { t("dplyr::matches("), i(1, "x"), t(")") }),
  s("sum", { t("dplyr::summarise("), i(1, "x"), t(")") }),
  s("group", { t("dplyr::group_by("), i(1, "x"), t(")") }),
  s("pull", { t("dplyr::pull("), i(1, "x"), t(")") }),
  s("gli", { t("dplyr::glimpse("), i(1, "x"), t(")") }),
  s("left", { t("dplyr::left_join("), i(1, "x"), t(")") }),
  s("inner", { t("dplyr::inner_join("), i(1, "x"), t(")") }),
  s("semi", { t("dplyr::semi_join("), i(1, "x"), t(")") }),
  s("wid", { t("tidyr::pivot_wider("), i(1, "x"), t(")") }),
  s("lon", { t("tidyr::pivot_longer("), i(1, "x"), t(")") }),
  s("map", { t("purrr::map("), i(1, "x"), t(")") }),
  s("vline", {
    t("# =========================================================================="), t({"", ""}),
    t("# "),i(1, "write text"), t({"", ""}),
    t("# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"), t({"", ""}),
  }),
}
