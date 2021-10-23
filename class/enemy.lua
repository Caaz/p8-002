enemy = _{
  extends = mob,
  sprite = 1,
  step = function(this)
    local player = _.states.game.player
    this:path_to(player.x,player.y)
    this:follow_path()
  end
}
