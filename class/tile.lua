Tile = _{
  id = 1,
  new = function(this, type)
    -- Type will refer to the type of tile this is
    -- ID will refer to the actual sprite used
    if type == 1 then
      this.id = 1
    elseif type == 2 then
      this.id = 2
    end
  end,
  draw = function(this)
    spr(1)
    -- love.graphics.setColor(1, 1, 1)
    -- local reference = TILES[this.id].frame
    -- WE LIVIN
    -- local quad = love.graphics.newQuad(
    --   reference.x,
    --   reference.y,
    --   reference.w,
    --   reference.h,
    --   tileset:getWidth(),
    --   tileset:getHeight()
    -- )
    -- love.graphics.draw(tileset, quad)
  end
}
