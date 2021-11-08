local buttons_down = {}
local buttons_pressed = {}

function btnp(id)
  -- Returns true if button had been pressed
  key_code = key_map(id)
  -- this looks dumb, but ensures we don't return nil.
  return buttons_pressed[key_code] == true
end

function love.keypressed(key)
  printh("pressed "..key)
  buttons_down[key] = true
end
function love.keyreleased(key)
  buttons_pressed[key] = true
  buttons_down[key] = false
end

function clear_buttons()
  buttons_pressed = {}
end

function key_map(id)
  local map = {
    [0]="left","right","up","down"
  }

  return map[id]
end
