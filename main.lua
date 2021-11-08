json = require('lib.json.json')
require('love.pico8')
require('const')
require('const_love')
require('helpers')
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
require('states.map_editor')
require('states.game')
-- testing


local internal_resolution = {1200,720}

print("hello world")
function love.load(args)
  love.window.setMode(internal_resolution[1], internal_resolution[2], {resizable=false})
  if #args > 0 and args[1] == "test" then
    require('states.test')
    require('tests.mob')
    require('tests.world')
    require('tests.enemy')
    require('tests.player')
    require('tests.tile')
    print = printh
    _.state'test'
  else
    _.state'map_editor'
  end
end

love.update = _update
love.draw = _draw
