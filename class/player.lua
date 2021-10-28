_player = _{
  extends = _mob,
  hostiles = function(this)
    mobs = {}
    -- build list of enemies
    foreach(this.world.mobs, function(mob)
      if mob != this then
        add(mobs, mob)
      end
    end)
    return mobs
  end,
  get_target = function(this)
    mobs = this:hostiles()
    sort_by_distance(mobs,this)
    return mobs[1]
  end,
  update = function(this)
    if btnp(0) then
      this:move(this.x-1,this.y)
    elseif btnp(1) then
      this:move(this.x+1,this.y)
    elseif btnp(2) then
      this:move(this.x,this.y-1)
    elseif btnp(3) then
      this:move(this.x,this.y+1)
    end
    -- if btnp(0) or btnp(1) or btnp(2) or btnp(3) then
    --   this:path_to(8,8)
    -- end
    -- debug stuff
    if btnp(4) then
      this.world:add_mob(_enemy{1,1})
    end
    if btnp(5) then
      target = this:get_target()
      if target then
        target.health -= 1
        printh('damaged?')
        printh(target.health)
      end
    end
    _mob.update(this)
  end,
  draw = function(this)
    x, y = this:real_position()
    spr(0,x,y)
    target = this:get_target()
    if target then
      x, y = target:real_position()
      printh()
      spr(2,x,y)
    end
  end
}
