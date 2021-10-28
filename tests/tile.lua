_coverage['tile'] = _tile
_tests['tile'] = {
  function()
    local tile = _tile()
    assert(
      tile:to_string() == "1, 1: 1",
      "to string got unexpected value"
    )
  end,
}
