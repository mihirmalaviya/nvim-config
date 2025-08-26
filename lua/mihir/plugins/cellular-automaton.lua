return {
  {
    "Eandrju/cellular-automaton.nvim",
    lazy = true,
    config = function()
      local function clamp(val, min, max) return math.min(math.max(val, min), max) end
      local ca = require("cellular-automaton")

      ca.register_animation({
        name = "brownian_battle",
        fps = 100,

        update = function(grid)
          local buffer = vim.deepcopy(grid)
          local directions = {
            { 1, 0 }, -- down
            { -1, 0 }, -- up
            { 0, 1 }, -- right
            { 0, -1 }, -- left
          }

          for i = 1, #grid do
            for j = 1, #grid[i] do
              if buffer[i][j].char ~= " " then
                local di, dj = unpack(directions[math.random(4)])
                local ni = clamp(i + di, 1, #grid)
                local nj = clamp(j + dj, 1, #grid[i])

                if buffer[ni][nj].char == " " then
                  grid[i][j], grid[ni][nj] = { char = " " }, buffer[i][j]
                else
                  grid[i][j] = buffer[i][j]
                end
              end
            end
          end
          return true
        end,
      })
    end,

    keys = {
      {
        "<leader>ca",
        function() require("cellular-automaton").start_animation("make_it_rain") end,
      },
      {
        "<leader>cb",
        function() require("cellular-automaton").start_animation("brownian_battle") end,
      },
    },
  },
}
