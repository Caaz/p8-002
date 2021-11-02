_tile = _{
  new = function(this, args)
    merge(
      this,
      {
        id = 1,
        sprite = 16,
        x = 1,
        y = 1
      }
    )
    merge(this,args)
    if this.id == 1 then
      this.passable = true
    end
  end,
  to_string = function(this)
    return this.x..", "..this.y..": "..this.id
  end,
  draw = function(this)
    local tx = this.x*tile_size-tile_size
    local ty = this.y*tile_size-tile_size
    spr(this.sprite,tx,ty)
  end
}
