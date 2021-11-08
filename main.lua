require('love.pico-helper')
require('const')
require('const_love')
require('helpers')
-- library stuff
require('lib.caaz.ichor')
require('lib.caaz.table.merge')
require('lib.caaz.table.contains')
require('lib.caaz.table.concat')
require('lib.caaz.table.forall')
require('lib.caaz.table.forxy')
require('lib.caaz.table.shift')
require('lib.caaz.vendor.sort')
require('lib.caaz.camera')
require('lib.caaz.debug')
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
