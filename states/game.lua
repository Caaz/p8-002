_.states['game'] = {
  init = function(this)
    this.world = world{}
    this.player = player{
      world=world
    }
  end,
  update = function(this)
    forall({this.world,this.player}, 'update')
  end,
  draw = function(this)
    foreach({this.world,this.player}, function(element)
      camera()
      element:draw()
    end)
  end
}
