_tile = _{
  id = 1,
  new = function(this, args)
    merge(this,args)
    if this.id == 1 then
      this.passable = true
    end
  end,
  to_string = function(this)
    return this.x..", "..this.y..": "..this.id
  end,
  draw = function(this,x,y)
    spr(15+this.id,x,y)
  end
}
