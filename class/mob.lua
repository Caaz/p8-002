mobs_created = 0
mob = _{
  x = 1,
  y = 1,
  offset_x = 0,
  offset_y = 0,
  sprite = 0,
  path = {},
  search = {},
  marked = {},
  new = function(this,args)
    mobs_created += 1
    this.id = mobs_created
    merge(this,args)
  end,
  update_search = function(this, parent, tx, ty)
    neighbors = this.world:get_neighbors(parent.x, parent.y, true)
    foreach(neighbors, function(tile)
      if contains(this.marked, tile) then
        del(neighbors, tile)
      else
        tile.parent = parent
      end
    end)
    concat(this.search, neighbors)
    concat(this.marked, neighbors)
    comparator = function(a, b)
      ax = a.x - tx
      ay = a.y - ty
      bx = b.x - tx
      by = b.y - ty
      return ax*ax+ay*ay < bx*bx+by*by
    end
    sort(this.search, comparator)
  end,
  path_to = function(this, tx, ty)
    this.path = {}
    this:update_search(this, tx, ty)
    while true do
      tile = shift(this.search)
      if tile.x == tx and tile.y == ty then
        add(this.path, tile)
        break
      end
      this:update_search(tile, tx, ty)
    end
    while(this.path[#this.path].parent) do
      add(this.path, this.path[#this.path].parent)
    end
    del(this.path,this)
    -- printh("Path of "..#this.path.." length")
    this.marked = {}
    this.search = {}
  end,
  move = function(this,x,y)
    if this.world:is_free(x,y) then
      old_x = this.x
      old_y = this.y
      this.x = x
      this.y = y
      this.offset_x += (old_x-this.x)*8
      this.offset_y += (old_y-this.y)*8
    end
  end,
  update = function(this)
    foreach({'offset_x','offset_y'}, function(offset)
      if this[offset] != 0 then
        this[offset] = this[offset]/1.6
        if abs(this[offset]) <= .5 then
          this[offset] = 0
        end
      end
    end)
  end,
  draw_path = function(this)
    if #this.path > 0 then
      foreach(this.path, function(tile)
        spr(1,(tile.x-1)*8,(tile.y-1)*8)
      end)
    end
  end,
  draw = function(this)
    x = this.x*tile_size-tile_size + this.offset_x
    y = this.y*tile_size-tile_size + this.offset_y
    spr(this.sprite, x, y)
  end
}
