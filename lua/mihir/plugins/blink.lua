return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  lazy = false,

  version = "1.*",

  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    keymap = { preset = "default" },

    appearance = {
      nerd_font_variant = "normal",
    },
  },
  opts_extend = { "sources.default" },
}
