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

function cls() end
function color() end
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
