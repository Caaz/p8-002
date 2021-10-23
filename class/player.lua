player = _{
  extends = mob,
  x = 1,
  y = 1,
  offset_x = 0,
  offset_y = 0,
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
    if btnp(0) or btnp(1) or btnp(2) or btnp(3) then
      this:path_to(8,8)
    end
    -- debug stuff
    if btnp(4) then
      this:path_to(8,8)
    end
    -- movement smoothing
    foreach({'offset_x','offset_y'}, function(offset)
      if this[offset] != 0 then
        this[offset] = this[offset]/1.6
        if abs(this[offset]) <= .5 then
          this[offset] = 0
        end
      end
    end)
  end,
  position = function(this)
    return {x=this.x, y=this.y}
  end,
  draw = function(this)
    local tx = this.x*tile_size-tile_size
    local ty = this.y*tile_size-tile_size
    spr(0,tx+this.offset_x,ty+this.offset_y)
    this:draw_path()
  end
}
