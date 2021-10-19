tile = _{
  id = 1,
  new = function(this, type)
    -- type will refer to the type of tile this is
    -- id will refer to the actual sprite used
    if type == 1 then
      this.id = 1
    elseif type == 2 then
      this.id = 2
    end
  end,
  draw = function(this,x,y)
    spr(1,x,y)
  end
}
