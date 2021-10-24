merge(_coverage,{
  mob=_mob
})
merge(_tests, {
  mob_increments_id = function()
    mobs = {_mob(),_mob()}
    assert(
      mobs[2].id == mobs[1].id + 1,
      "mob id didn't increment"
    )
  end
})
