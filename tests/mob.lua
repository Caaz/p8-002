_coverage['mob'] = _mob
_tests['mob'] = {
  function()
    mobs = {_mob(),_mob()}
    assert(
      mobs[2].id == mobs[1].id + 1,
      "mob id didn't increment"
    )
  end,
  function()
    local mob, world = _mob(), _world()
    world:add_mob(mob)
    mob:path_to(1,5,true)
    assert(
      #mob.path == 4,
      "expected path length of 4, got "..#mob.path
    )
    mob:follow_path()
    assert(
      #mob.path == 3,
      "expected path length of 3, got "..#mob.path
    )
  end
}
