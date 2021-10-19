world = _{
  new = function(this)
    this:clear_world()
    return this
  end,
  update = function()
  end,
  clear_world = function(this)
    this.tiles = {}
    for x = 1, world_size do
      this.tiles[x] = {}
      for y = 1, world_size do
        this.tiles[x][y] = tile(flr(rnd(2))+1)
      end
    end
  end,
  get_tile = function(this, x, y)
    if this.tiles[x] and this.tiles[x][y] then
      return this.tiles[x][y]
    end
    return tile(1)
  end,
  draw = function(this)
    forxy(this.tiles, function(tile, x, y)
      local tx = x*tile_size-tile_size
      local ty = y*tile_size-tile_size
      tile:draw(tx,ty)
    end)
  end
}
