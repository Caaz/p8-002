require('love.pico-helper')
require('const')
require('helpers')
-- library stuff
require('lib.ichor')
require('lib.table.merge')
require('lib.table.contains')
require('lib.table.concat')
require('lib.table.forall')
require('lib.table.forxy')
require('lib.table.shift')
require('lib.vendor.sort')
require('lib.camera')
require('lib.debug')
-- classes
require('class.mob')
require('class.tile')
require('class.timer')
require('class.world')
require('class.enemy')
require('class.player')
require('class.cursor')
-- states
-- require('states.test')
require('states.map_editor')
require('states.game')
-- testing
-- require('tests.mob')
-- require('tests.world')
-- require('tests.enemy')
-- require('tests.player')
-- require('tests.tile')


local internal_resolution = {1200,720}

print("hello world")
function love.load()
  love.window.setMode(internal_resolution[1], internal_resolution[2], {resizable=false})
  _.state'map_editor'
end

love.update = _update
love.draw = _draw
-- function love.update(delta)
--   _.main('update', delta)
-- end
--
-- function love.draw()
--   _.main'draw'
-- end
