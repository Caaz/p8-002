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
      this.world:set_tile(this.x,this.y,2)
    end
    _mob.update(this)
  end,
  move = function(this, x, y)
    _mob.move(this, max(min(x,world_size),1), max(min(y,world_size),1), true)
  end,
  draw = function(this)
    x, y = this:real_position()
    color(flr(frame/10) % 2 == 0 and 7 or 6)
    line(x+1,y-1,x-1,y-1)
    line(x-1,y+1)
    line(x+6,y-1,x+8,y-1)
    line(x+8,y+1)
    line(x+8,y+6,x+8,y+8)
    line(x+6,y+8)
    line(x+1,y+8,x-1,y+8)
    line(x-1,y+6)
  end,
}
