local standard_print = print
function printh(msg)
  -- prints directly to the terminal
  if msg and string.sub(msg,-1) == "\0" then
    io.write(msg)
  else
    standard_print(msg)
  end
end

function stop(msg)
  -- exits the program, with an optional message.
  if msg then
    printh(msg)
  end
  love.event.quit(0)
end

function all(t)
  -- iterable for looping through all elements in a table.
  local i = 0
  local n = #t
  return function()
    i = i + 1
    if i <= n then return t[i] end
  end
end

function foreach(t, callback)
  -- iterates through each element in a table, and calls a callback function
  for i = 1, #t do
    if t[i] then
      callback(t[i])
    end
  end
end


function del(t,item)
  -- deletes the first instance of an item from a table
  for i = 1, #t do
    if t[i] == item then
      return table.remove(t, i)
    end
  end
end

function count(t,item)
  -- counts the amount of times an item appears in a table.
  local c = 0
  for i = 1, #t do
    if t[i] == item then
      c = c + 1
    end
  end
  return c
end


add = table.insert
deli = table.remove
