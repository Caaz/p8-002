_coverage['enemy'] = _enemy
_tests['enemy'] = {
  function()
    local enemy, world = _enemy(), _world()
    -- stand in for the player
    world:add_mob(_mob{1,2})
    world:add_mob(enemy)
    enemy:step()
    assert(
      enemy:at_target(world.mobs[1]),
      "expected to be at target"
    )
  end
}
