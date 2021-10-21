mob = _{
  x = 1,
  y = 1,
  offset_x = 0,
  offset_y = 0,
  sprite = 0,
  move = function(this,x,y)
    if this.world:is_free(x,y) then
      old_x = this.x
      old_y = this.y
      this.x = x
      this.y = y
      this.offset_x += (old_x-this.x)*8
      this.offset_y += (old_y-this.y)*8
    end
  end,
  update = function(this)
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
    x = this.x*tile_size-tile_size + this.offset_x
    y = this.y*tile_size-tile_size + this.offset_y
    spr(this.sprite, x, y)
  end
}
