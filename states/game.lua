_.states['game'] = {
  init = function(this)
    printh("game start")
    this.world = _world{}
    this.world:add_mob(_player())
  end,
  update = function(this)
    this.world:update()
    local x,y = this.world.mobs[1]:real_position()
    camera:focus(x+4,y+4)
    camera:update()
  end,
  draw = function(this)
    camera:apply()
    this.world:draw()
  end
}
