tile = _{
  id = 1,
  new = function(this, type)
    -- type will refer to the type of tile this is
    -- id will refer to the actual sprite used
    this.goals = {}
    if type == 1 then
      this.id = 1
      this.passable = false
    elseif type == 2 then
      this.id = 2
      this.passable = true
    end
  end,
  draw = function(this,x,y)
    spr(15+this.id,x,y)
    if this.goals['player'] then
      spr(17+this.goals['player'],x,y)
    end
  end
}
