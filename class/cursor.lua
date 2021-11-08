_cursor = _{
  extends = _mob,
  update = function(this)
    if btnp(0) then
      this:move(this.x-1,this.y)
    elseif btnp(1) then
      this:move(this.x+1,this.y)
    elseif btnp(2) then
      this:move(this.x,this.y-1)
    elseif btnp(3) then
      this:move(this.x,this.y+1)
    end
    if btnp(4) then
      this.editor:set_tile(this.x,this.y)
    end
    _mob.update(this)
  end,
  move = function(this, x, y)
    _mob.move(this, mid(x,world_size,1), mid(y,world_size,1), true)
  end,
  draw = function(this)
    local x, y = this:real_position()
    color(flr(frame/10) % 2 == 0 and 7 or 6)
    local inner, inner_b = flr(tile_size - tile_size/4), flr(tile_size/4)-1
    line(x+inner_b,y-1,x-1,y-1)
    line(x-1,y+inner_b)
    line(x+inner,y-1,x+tile_size,y-1)
    line(x+tile_size,y+inner_b)
    line(x+tile_size,y+inner,x+tile_size,y+tile_size)
    line(x+inner,y+tile_size)
    line(x+inner_b,y+tile_size,x-1,y+tile_size)
    line(x-1,y+inner)
  end,
}
