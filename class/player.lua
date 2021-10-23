player = _{
  extends = mob,
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
      this.world:add_mob(enemy{1,1})
    end
    mob.update(this)
  end,
  draw = function(this)
    local tx = this.x*tile_size-tile_size
    local ty = this.y*tile_size-tile_size
    spr(0,tx+this.offset_x,ty+this.offset_y)
  end
}
