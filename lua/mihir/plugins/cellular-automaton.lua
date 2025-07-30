return {
  {
    "Eandrju/cellular-automaton.nvim",
    config = function()
      local function clamp(val, min, max) return math.min(math.max(val, min), max) end
      local ca = require("cellular-automaton")

      -- local particles = {}
      -- local types = {}

      local animations = {
        {
          name = "slide",
          fps = 20,

          update = function(grid)
            for i = 1, #grid do
              local prev = grid[i][#grid[i]]
              for j = 1, #grid[i] do
                grid[i][j], prev = prev, grid[i][j]
              end
            end
            return true
          end,
        },

        {
          name = "brownian_battle",
          fps = 30,

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
        },

        --   {
        --     name = "particle_life",
        --     fps = 30,
        --
        --     init = function(grid)
        --       for i = 1, #grid do
        --         for j = 1, #grid[i] do
        --           table.insert(particles, grid[i][j])
        --         end
        --       end
        --     end,
        --     update = function(grid)
        --       local buffer = vim.deepcopy(grid)
        --       local directions = {
        --         { 1, 0 }, -- down
        --         { -1, 0 }, -- up
        --         { 0, 1 }, -- right
        --         { 0, -1 }, -- left
        --       }
        --
        --       for i = 1, #grid do
        --         for j = 1, #grid[i] do
        --           if buffer[i][j].char ~= " " then
        --             local di, dj = unpack(directions[math.random(4)])
        --             local ni = clamp(i + di, 1, #grid)
        --             local nj = clamp(j + dj, 1, #grid[i])
        --
        --             if buffer[ni][nj].char == " " then
        --               grid[i][j], grid[ni][nj] = { char = " " }, buffer[i][j]
        --             else
        --               grid[i][j] = buffer[i][j]
        --             end
        --           end
        --         end
        --       end
        --       return true
        --     end,
        --   },
      }

      for _, animation in ipairs(animations) do
        ca.register_animation(animation)
      end
    end,

    keys = {
      {
        "<leader>ca",
        function() require("cellular-automaton").start_animation("make_it_rain") end,
      },
      {
        "<leader>cS",
        function() require("cellular-automaton").start_animation("scramble") end,
      },
      {
        "<leader>cs",
        function() require("cellular-automaton").start_animation("slide") end,
      },
      {
        "<leader>cb",
        function() require("cellular-automaton").start_animation("brownian_battle") end,
      },
    },
  },
}
