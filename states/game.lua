_.states['game'] = {
  init = function(this)
    printh("Game start")
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
    cls()
    -- camera(x-60,y-60)
    camera:apply()
    this.world:draw()
    camera()
    print(stat(1)*100,0,0)
  end
}
