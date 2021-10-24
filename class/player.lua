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
      mobs = this:hostiles()
      if #mobs > 0 then
        mobs[1].health -= 1
        printh('damaged?')
        printh(mobs[1].health)
      end
    end
    _mob.update(this)
  end,
  draw = function(this)
    local tx = this.x*tile_size-tile_size
    local ty = this.y*tile_size-tile_size
    spr(0,tx+this.offset_x,ty+this.offset_y)
  end
}
