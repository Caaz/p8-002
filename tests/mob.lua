merge(_coverage,{
  mob=_mob
})
_tests['mob'] = {
  function()
    mobs = {_mob(),_mob()}
    assert(
      mobs[2].id == mobs[1].id + 1,
      "mob id didn't increment"
    )
  end,
  function()
    -- not much to assert here.
    local mob = _mob()
    mob:update()
    mob:draw()
  end,
  function()
    local mob, world = _mob(), _world()
    world:add_mob(mob)
    mob:path_to(1,5)
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
