player = _{
  x = 1,
  y = 1,
  offset_x = 0,
  offset_y = 0,
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
    if btnp(0) or btnp(1) or btnp(2) or btnp(3) then
      local tile = this.world:get_tile(this.x,this.y)[2]
      if not tile.passable then
      -- if the tile we've moved to isn't valid
      -- return to origin
        this.x = old_position.x
        this.y = old_position.y
      else
        -- otherwise, set up offset
        this.offset_x += (old_position.x-this.x)*8
        this.offset_y += (old_position.y-this.y)*8
        -- Also, create a new path for player
        this.world:create_path('player',this.x,this.y)
      end
    end
    -- debug stuff
    if btnp(4) then
      this.world:add_mob(enemy{})
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
  end
}
