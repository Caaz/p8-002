function direction_to_xy(direction)
  local x, y
  if direction == 1 then
    return {0,1}
  elseif direction == 2 then
    return {1,0}
  elseif direction == 3 then
    return {-1,0}
  else
    return {0,-1}
  end
end
