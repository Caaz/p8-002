player = _{
  x = 1,
  y = 1,
  update = function(this)
    printh(this.world)
  end,
  draw = function(this)
    local tx = this.x*tile_size-tile_size
    local ty = this.y*tile_size-tile_size
    camera(-tx,-ty)
    spr(0)
  end
}
