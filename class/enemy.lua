_enemy = _{
  extends = _mob,
  sprite = 1,
  at_target = function(this, target)
    neighbors = this.world:get_neighbors(this.x, this.y)
    there = false
    foreach(neighbors, function(tile)
      if target == this.world:mob_at(tile.x, tile.y) then
        there = true
      end
    end)
    return there
  end,
  step = function(this)
    local player = this.world.mobs[1]
    if this:at_target(player) then
      return
    end
    targets = this.world:get_neighbors(player.x, player.y, true)
    if #targets > 0 then
      sort_by_distance(targets, this)
      target = targets[1]
      this:path_to(target.x,target.y)
      this:follow_path()
    end
  end
}
