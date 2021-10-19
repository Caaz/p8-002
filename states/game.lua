_.states['game'] = {
  init = function(this)
    printh("Game start")
    this.world = world{}
    this.player = player{
      world=this.world
    }
  end,
  update = function(this)
    forall({this.world,this.player}, 'update')
  end,
  draw = function(this)
    forall({this.world,this.player}, 'draw')
  end
}
