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

function sort_by_distance(points, target)
  sort(points, function(a, b)
    ax = a.x - target.x
    ay = a.y - target.y
    bx = b.x - target.x
    by = b.y - target.y
    return ax*ax+ay*ay < bx*bx+by*by
  end)
end
