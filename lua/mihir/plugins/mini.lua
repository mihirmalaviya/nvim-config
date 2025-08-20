return {
  "echasnovski/mini.nvim",
  -- lazy = false,
  version = false,
  config = function()
    local clue = require("mini.clue")
    clue.setup({
      triggers = {
        -- Built-in completion
        { mode = "i", keys = "<C-x>" },

        -- `g` key
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },

        -- Marks
        { mode = "n", keys = "'" },
        { mode = "n", keys = "`" },
        { mode = "x", keys = "'" },
        { mode = "x", keys = "`" },

        -- Registers
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },
        { mode = "i", keys = "<C-r>" },
        { mode = "c", keys = "<C-r>" },

        -- Window commands
        { mode = "n", keys = "<C-w>" },

        -- `z` key
        { mode = "n", keys = "z" },
        { mode = "x", keys = "z" },
      },

      clues = {
        clue.gen_clues.builtin_completion(),
        clue.gen_clues.g(),
        clue.gen_clues.marks(),
        clue.gen_clues.registers(),
        clue.gen_clues.windows(),
        clue.gen_clues.z(),
      },

      window = {
        delay = 500,
        config = {
          width = 40,
          border = "rounded",
        },
      },
    })

    -- local hipatterns = require("mini.hipatterns")
    -- hipatterns.setup({
    --   highlighters = {
    --     -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    --     fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
    --     hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
    --     todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
    --     note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
    --
    --     -- Highlight hex color strings (`#rrggbb`) using that color
    --     hex_color = hipatterns.gen_highlighter.hex_color(),
    --   },
    -- })
  end,
}
