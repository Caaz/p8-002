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
  end
}
