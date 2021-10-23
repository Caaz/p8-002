_tile = _{
  id = 1,
  new = function(this, args)
    merge(this,args)
    if this.id == 1 then
      this.passable = true
    end
  end,
  -- to_string = function(this)
  --   return this.x..", "..this.y..": "..this.id
  -- end,
  draw = function(this)
    local tx = this.x*tile_size-tile_size
    local ty = this.y*tile_size-tile_size
    spr(15+this.id,tx,ty)
  end
}
