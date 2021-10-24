merge(_coverage,{
  world=_world
})
merge(_fixtures, {
  world = _world{}
})
merge(_tests, {
  test_coverage = function(fixtures)
    fixtures.world:add_mob(_mob())
  end
})
