world = _{
  new = function(this)
    this:clear_world()
  end,
  update = function()
  end,
  clear_world = function(this)
    -- sets the entire world to walls
    this.tiles = {}
    for x = 1, world_size do
      this.tiles[x] = {}
      for y = 1, world_size do
        this.tiles[x][y] = tile(2)
      end
    end
  end,
  draw = function(this)
    forxy(this.tiles, function(tile, x, y)
      local tx = x*tile_size-tile_size
      local ty = y*tile_size-tile_size
      tile:draw(tx,ty)
    end)
  end
}
