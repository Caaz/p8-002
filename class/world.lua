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
    forall(this.timers,'update')
    forall(this.mobs,'update',this)
  end,
  add_mob = function(this, mob)
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
        this.tiles[x][y] = tile(rnd()<.3 and 1 or 2)
      end
    end
  end,
  get_tile = function(this, x, y)
    if this.tiles[x] and this.tiles[x][y] then
      return {true, this.tiles[x][y]}
    end
    return {false, tile(1)}
  end,
  clear_path = function(this, key)
    forxy(this.tiles, function(tile, x, y)
      tile.goals[key] = nil
    end)
  end,
  create_path = function(this, key, x, y, distance)
    this:clear_path(key)
    distance = distance and distance or 61
    path_queue = this:get_neighbors(x,y)
    while(distance > 0 and #path_queue > 0) do
      data = shift(path_queue)
      local tile = data[1][2]
      if data[1][1] and tile.passable and not tile.goals[key] then
        tile.goals[key] = data[4]
        distance -= 1
        concat(path_queue, this:get_neighbors(data[2], data[3]))
      end
    end
  end,
  get_neighbors = function(this,x,y)
    -- wads order
    return {
      {this:get_tile(x,y-1), x, y-1, 1},
      {this:get_tile(x-1,y), x-1, y, 2},
      {this:get_tile(x+1,y), x+1, y, 3},
      {this:get_tile(x,y+1), x, y+1, 4}
    }
  end,
  draw = function(this)
    forxy(this.tiles, function(tile, x, y)
      local tx = x*tile_size-tile_size
      local ty = y*tile_size-tile_size
      tile:draw(tx,ty)
    end)
    forall(this.mobs,'draw')
  end
}
