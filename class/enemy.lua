enemy = _{
  extends = mob,
  sprite = 1,
  step = function(this)
    -- local tile = this.world:get_tile(this.x, this.y)
    -- direction = tile[2].goals['player']
    -- if direction then
    --   xy = direction_to_xy(direction)
    --   this:move(this.x+xy[1],this.y+xy[2])
    -- end
  end
}
