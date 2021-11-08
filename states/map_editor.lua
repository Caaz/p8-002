_.states['map_editor'] = {
  init = function(this)
    printh("editor start")
    this.world = _world{}
    this.world:add_mob(_cursor{editor=this})
  end,
  update = function(this)
    this.world:update()
    local x,y = this.world.mobs[1]:real_position()
    camera:focus(x+tile_size/2,y+tile_size/2)
    camera:update()
  end,
  set_tile = function(this, x, y)
    tile = this.world:set_tile(x, y, 2)
    if tile then
      tile.sprite = 64 + this:get_bitfield(tile)
      foreach(this.world:get_neighbors(x,y), function(tile)
        if tile.id == 2 then
          tile.sprite = 64 + this:get_bitfield(tile)
        end
      end)
    end
  end,

  get_bitfield = function(this, tile)
    -- wads order
    printh(tile:to_string())
    local x, y = tile.x, tile.y
    local neighbors = {
      this.world:get_tile(x,y-1),
      this.world:get_tile(x-1,y),
      this.world:get_tile(x+1,y),
      this.world:get_tile(x,y+1)
    }
    local bitfield = 0
    for i = 1, 4 do
      if neighbors[i] and neighbors[i].id == tile.id then
        bitfield = bor(bitfield,shl(1,i-1))
      end
    end
    printh(bitfield)
    return bitfield
  end,
  draw = function(this)
    camera:apply()
    this.world:draw()
  end
}
