World = _{
  new = function(this)
    this:clear_world()
  end,
  update = function()
  end,
  clear_world = function(this)
    -- Sets the entire world to walls
    this.tiles = {}
    for x = 1, WORLD_SIZE do
      this.tiles[x] = {}
      for y = 1, WORLD_SIZE do
        this.tiles[x][y] = Tile(2)
      end
    end
  end,
  draw = function(this)
    forxy(this.tiles, function(tile, x, y)
      local tx = x*TILE_SIZE-TILE_SIZE
      local ty = y*TILE_SIZE-TILE_SIZE
      camera(-tx, -ty)
      tile:draw()
    end)
  end
}
