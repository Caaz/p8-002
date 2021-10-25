mobs_created = 0
_mob = _{
  new = function(this,args)
    mobs_created += 1
    this.id = mobs_created
    merge(this, {
      health = 1,
      x = 1,
      y = 1,
      offset_x = 1,
      offset_y = 1,
      sprite = 1,
      path = {},
      marked = {},
      search = {}
    })
    merge(this,args)
  end,
  update_search = function(this, parent, tx, ty)
    local neighbors = this.world:get_neighbors(parent.x, parent.y, true)
    foreach(neighbors, function(tile)
      if contains(this.marked, tile) then
        del(neighbors, tile)
      else
        tile.parent = parent
      end
    end)
    if #neighbors <= 0 then return end
    concat(this.search, neighbors)
    concat(this.marked, neighbors)
    sort_by_distance(this.search, {x=tx,y=ty})
  end,
  path_to = function(this, tx, ty, limit)
    limit = limit and limit or 128*(1-stat(1))
    this.path = {}
    this:update_search(this, tx, ty)
    while true do
      if #this.search == 0 then break end
      debugp(this.search)
      local tile = shift(this.search)
      if tile.x == tx and tile.y == ty then
        add(this.path, tile)
        break
      end
      limit -= 1
      if limit <= 0 then break end
      this:update_search(tile, tx, ty)
    end
    if #this.path > 0 then
      while(this.path[#this.path].parent) do
        add(this.path, this.path[#this.path].parent)
      end
      del(this.path,this)
    end
    this.marked = {}
    this.search = {}
  end,
  follow_path = function(this)
    if #this.path > 0 then
      local step = this.path[#this.path]
      if this.world:is_free(step.x, step.y) then
        this:move(step.x, step.y)
        deli(this.path)
      end
    end
  end,
  move = function(this,x,y)
    if this.world:is_free(x,y) then
      old_x = this.x
      old_y = this.y
      this.x = x
      this.y = y
      this.offset_x += (old_x-x)*8
      this.offset_y += (old_y-y)*8
    end
  end,
  -- step = function(this) end,
  update = function(this)
    foreach({'offset_x','offset_y'}, function(offset)
      if this[offset] != 0 then
        this[offset] = this[offset]/1.6
        if abs(this[offset]) <= .5 then
          this[offset] = 0
        end
      end
    end)
    if this.health <= 0 then
      del(this.world.mobs, this)
      del(this,this.world)
    end
  end,
  draw_path = function(this)
    if #this.path > 0 then
      c = 1
      foreach(this.path, function(tile,i)
        print(c,(tile.x-1)*8,(tile.y-1)*8)
        c+=1
      end)
    end
  end,
  draw = function(this)
    x = this.x*tile_size-tile_size + this.offset_x
    y = this.y*tile_size-tile_size + this.offset_y
    spr(this.sprite, x, y)
    this:draw_path()
  end
}
