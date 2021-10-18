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
  draw = function(this)
    spr(1)
    -- love.graphics.setcolor(1, 1, 1)
    -- local reference = tiles[this.id].frame
    -- we livin
    -- local quad = love.graphics.newquad(
    --   reference.x,
    --   reference.y,
    --   reference.w,
    --   reference.h,
    --   tileset:getwidth(),
    --   tileset:getheight()
    -- )
    -- love.graphics.draw(tileset, quad)
  end
}
