-- remove color codes
default_print = print
function print(msg, color)
  if msg and string.sub(msg,-1) == "\0" then
    io.write(msg)
  else
    default_print(msg)
  end
end
printh = print
-- exits the program
function stop(msg)
  print(msg)
  love.event.quit(0)
end
function all(t)
  local i = 0
  local n = #t
  return function()
    i = i + 1
    if i <= n then return t[i] end
  end
end
function foreach(t, callback)
  for i = 1, #t do
    if t[i] then
      callback(t[i])
    end
  end
end
add = table.insert
deli = table.remove
function del(t,item)
  for i = 1, #t do
    if t[i] == item then
      removed = table.remove(t, i)
      return removed
    end
  end
end
function count(t,item)
  local c = 0
  for i = 1, #t do
    if t[i] == item then
      c = c + 1
    end
  end
  return c
end

flr = math.floor


function noop() end
cls = noop
color = noop
btnp = noop
-- drawing functions
last_line_x = 0
last_line_y = 0
function line(x1, y1, x2, y2, ...)
  if not x2 then
    x2, y2 = x1, y1
    x1, y1 = last_line_x, last_line_y
  end
  love.graphics.line(x1,y1,x2,y2)
  last_line_x, last_line_y = x2, y2
end

function spr(id, x, y)
  -- love.graphics.line(x1,y1,x2,y2)
  love.graphics.rectangle('fill', x, y, tile_size, tile_size)
end

-- camera = love.graphics.translate
function camera(x,y)
  love.graphics.translate(-x,-y)
end
