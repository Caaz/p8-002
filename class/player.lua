player = _{
  x = 1,
  y = 1,
  update = function(this)
    old_position = this:position()
    if btnp(0) then
      this.x -= 1
    elseif btnp(1) then
      this.x += 1
    elseif btnp(2) then
      this.y -= 1
    elseif btnp(3) then
      this.y += 1
    end
    local tile = this.world:get_tile(this.x,this.y)
    if not tile.passable then
      this.x = old_position.x
      this.y = old_position.y
    end
  end,
  position = function(this)
    return {x=this.x, y=this.y}
  end,
  draw = function(this)
    local tx = this.x*tile_size-tile_size
    local ty = this.y*tile_size-tile_size
    spr(0,tx,ty)
  end
}
