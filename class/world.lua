world = _{
  new = function(this)
    this:clear_world()
    this.mobs = {}
    this.timers = {
      timer{
        timeout = mob_timer,
        callback = function(timer)
          this:step_mobs()
          timer.time = 0
        end
      }
    }
  end,
  update = function(this)
    -- printh()
    forall(this.timers,'update')
    forall(this.mobs,'update',this)
  end,
  add_mob = function(this, mob)
    mob.world = this
    add(this.mobs, mob)
  end,
  step_mobs = function(this)
    forall(this.mobs,'step',this)
  end,
  clear_world = function(this)
    this.tiles = {}
    for x = 1, world_size do
      this.tiles[x] = {}
      for y = 1, world_size do
        this.tiles[x][y] = _tile{
          x = x,
          y = y,
          id = rnd()>.7 and 2 or 1
        }
      end
    end
  end,
  get_tile = function(this, x, y)
    if this.tiles[x] and this.tiles[x][y] then
      return this.tiles[x][y]
    end
    return nil
  end,
  mob_at = function(this, x, y)
    for mob in all(this.mobs) do
      if mob.x == x and mob.y == y then
        return mob
      end
    end
  end,
  is_free = function(this, x, y, tile)
    tile = tile and tile or this:get_tile(x,y)
    if not tile or not tile.passable then
      return false
    end
    if this:mob_at(tile.x, tile.y) then return false end
    return true
  end,
  get_neighbors = function(this,x,y,remove_nil,only_free)
    -- wads order
    neighbors = {
      this:get_tile(x,y-1),
      this:get_tile(x-1,y),
      this:get_tile(x+1,y),
      this:get_tile(x,y+1)
    }
    if remove_nil then
      for i = 0, count(neighbors,nil) do del(neighbors,nil) end
    end
    if only_free then
      foreach(neighbors, function(tile)
        if not this:is_free(nil,nil,tile) then
          del(neighbors, tile)
        end
      end)
    end
    return neighbors
  end,
  draw = function(this)
    forxy(this.tiles, function(tile)
      tile:draw()
    end)
    forall(this.mobs,'draw')
  end
}
