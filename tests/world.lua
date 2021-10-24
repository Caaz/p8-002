merge(_coverage,{
  world=_world
})
merge(_tests, {
  mobs_add_properly = function()
    local world = _world{}
    local mob_table = world.mobs
    local count = #world.mobs
    world:add_mob(_mob())
    assert(
      #mob_table == count + 1,
      "mob table didn't increase"
    )
    assert(
      mob_table[#mob_table].world == world,
      "mob doesn't have world reference set"
    )
  end,
  world_initializes = function()
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
  get_tile = function()
    local world = _world{}
    local tile = world:get_tile(1,1)
    assert(
      tile == world.tiles[1][1],
      "get tile didn't match expected value"
    )
  end,
  step_mobs = function()
    local world = _world{}
    local called = false
    world:add_mob(_mob{
      step = function(this)
        called = true
      end
    })
    world:step_mobs()
    assert(called,"didn't call mobs step function")
  end,
  update_mobs = function()
    local world = _world{}
    local called = false
    world:add_mob(_mob{
      update = function(this)
        called = true
      end
    })
    world:update()
    assert(called,"didn't call mobs update function")
  end,
  is_free = function()
    local world = _world()
    assert(
      world:is_free(1,1),
      "empty tile wasn't free"
    )
  end
})
