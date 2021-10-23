_.states['game'] = {
  init = function(this)
    printh("Game start")
    this.world = world{}
    this.world:add_mob(player())
  end,
  update = function(this)
    this.world:update()
  end,
  draw = function(this)
    cls()
    this.world:draw()
    print(stat(1)*100,0,0)
  end
}
