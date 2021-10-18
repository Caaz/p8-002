_.states['game'] = {
  init = function(this)
    this.world = world{}
  end,
  update = function()
    -- print'hello world'
  end,
  draw = function(this)
    this.world:draw()
  end
}
