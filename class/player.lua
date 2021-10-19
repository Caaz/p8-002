player = _{
  x = 1,
  y = 1,
  update = function(this)
    printh(this.world)
    if btnp(0) then
      this.x -= 1
    elseif btnp(1) then
      this.x += 1
    elseif btnp(2) then
      this.y -= 1
    elseif btnp(3) then
      this.y += 1
    end
  end,
  draw = function(this)
    local tx = this.x*tile_size-tile_size
    local ty = this.y*tile_size-tile_size
    spr(0,tx,ty)
  end
}
