merge(_coverage,{
  world=_world
})
_tests['world'] = {
  function()
    local world = _world{}
    local mob_table = world.mobs
    local count = #world.mobs
    world:add_mob({})
    assert(
      #mob_table == count + 1,
      "mob table didn't increase"
    )
    assert(
      mob_table[#mob_table].world == world,
      "mob doesn't have world reference set"
    )
  end,
  function()
    local world = _world{}
    assert(
      #world.mobs == 0,
      "mobs table not zero?"
    )
    assert(
      #world.timers > 0,
      "timer table not initialized"
    )
  end,
  function()
    local world = _world{}
    local tile = world:get_tile(1,1)
    assert(
      tile == world.tiles[1][1],
      "get tile didn't match expected value"
    )
  end,
  function()
    local world = _world{}
    local called = false
    world:add_mob({
      step = function(this)
        called = true
      end
    })
    world:step_mobs()
    assert(called,"didn't call mobs step function")
  end,
  function()
    local world = _world{}
    local called = false
    world:add_mob({
      update = function(this)
        called = true
      end
    })
    world:update()
    assert(called,"didn't call mobs update function")
  end,
  function()
    local world = _world{}
    local called = false
    world:add_mob({
      draw = function(this)
        called = true
      end
    })
    world:draw()
    assert(called,"didn't call mobs draw function")
  end,
  function()
    local world = _world()
    assert(
      world:is_free(1,1),
      "empty tile wasn't free"
    )
  end,
  -- function()
  --   assert(false)
  -- end
}
