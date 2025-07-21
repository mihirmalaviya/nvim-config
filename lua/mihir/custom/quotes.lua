local M = {}

local MAX_WIDTH = 80

local quotes = {
  {
    "An idiot admires complexity, a genius admires simplicity.",
    "Terry A. Davis",
  },
  {
    [[What's reality? I don't know. When my bird was looking at my computer monitor I thought "That bird has no idea what he's looking at." And yet what does the bird do? Does he panic? No, he can't really panic, he just does the best he can. Is he able to live in a world where he's so ignorant? Well, he doesn't really have a choice. The bird is okay even though he doesn't understand the world. You're that bird looking at the monitor, and you're thinking to yourself, I can figure this out. Maybe you have some bird ideas. Maybe that's the best you can do.]],
    "Terry A. Davis",
  },
  {
    "Premature optimization is the root of all evil.",
    "Donald Knuth",
  },
  {
    "... the matter is now so clear to me, the nature of real space so palpable, that methinks I could make a child understand it.",
    "Edwin A. Abbott, Flatland: A Romance of Many Dimensions",
  },
}

local delimiter = " - "

local function right_adjust(str, width)
  return string.rep(" ", width - #str) .. str
end

local function wrap_text(q, max_width)
  local lines = {}
  local current_line = {}
  local line_len = 0

  local quote, author = unpack(q)
  local attribution = delimiter .. author

  if #quote + #attribution <= max_width then
    return { quote .. attribution }
  end

  local text = quote

  for word in string.gmatch(text, "%S+") do
    local word_len = #word
    local additional_len = (line_len > 0) and (word_len + 1) or word_len

    if line_len + additional_len > max_width then
      table.insert(lines, table.concat(current_line, " "))
      current_line = {}
      line_len = 0
    end

    table.insert(current_line, word)
    line_len = line_len + additional_len
  end

  local last_line = table.concat(current_line, " ")
  if #current_line > 0 then
    table.insert(lines, last_line)
  end

  if #last_line >= #attribution then
    table.insert(lines, "")
  end

  table.insert(lines, right_adjust(attribution, max_width))

  return lines
end

local function format_quote(q)
  return wrap_text(q, MAX_WIDTH)
end

function M.random_quote()
  math.randomseed(os.time())
  local q = quotes[math.random(#quotes)]
  return format_quote(q)
end

return M
