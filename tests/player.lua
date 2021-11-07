_coverage['player'] = _player
_tests['player'] = {
  function()
    local player, enemy, world = _player(), _enemy{x=1,y=3}, _world()
    world:add_mob(player)
    world:add_mob(enemy)
    -- enemy:step()
    local hostiles = player:hostiles()
    assert(
      #hostiles == 1,
      "hostiles length not expected, got "..#hostiles
    )
    assert(
      hostiles[1] == enemy,
      "enemy not in hostiles return"
    )
  end
}
