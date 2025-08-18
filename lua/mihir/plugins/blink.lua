return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  -- lazy = false,

  version = "1.*",

  opts = {
    keymap = { preset = "default" },
    appearance = { nerd_font_variant = "normal" },
  },
  opts_extend = { "sources.default" },
}
