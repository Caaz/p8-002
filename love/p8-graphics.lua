-- Sets up a spritesheet (drawable image) and spritesheet_data (bounds of individual sprites)
local spritesheet, spritesheet_data = (function()
  local file = io.open("assets/tileset.json")
  local json_string = file:read("*all")
  file:close()
  local object = json.decode(json_string)
  return love.graphics.newImage("assets/tileset.png"), object.frames
end)()

function spr(id, x, y)
  -- Draws a sprite from the spritesheet at x,y coordinates.
  love.graphics.setColor(1, 1, 1)
  local reference = spritesheet_data["None"].frame
  local quad = love.graphics.newQuad(
    reference.x,
    reference.y,
    reference.w,
    reference.h,
    spritesheet:getWidth(),
    spritesheet:getHeight()
  )
  love.graphics.draw(spritesheet, quad, x, y)
end

local last_line_x, last_line_y
function line(x1, y1, x2, y2, ...)
  -- Draws a line from two points, uses the last point drawn if a second point isn't provided.
  if not x2 then
    x2, y2 = x1, y1
    x1, y1 = last_line_x, last_line_y
  end
  love.graphics.line(x1,y1,x2,y2)
  last_line_x, last_line_y = x2, y2
end

function camera(x,y)
  -- Simulates the pico-8 camera, which is backwards for whatever reason.
  love.graphics.translate(-x,-y)
end

-- TODO: These functions
cls = noop
color = noop
btnp = noop
print = noop
function print(text, x, y, ...)
  love.graphics.print(text, x, y)
end
