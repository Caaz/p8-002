require('love.pico-helper')
require('const')
require('helpers')
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
require('class.mob')
require('class.tile')
require('class.timer')
require('class.world')
require('class.enemy')
require('class.player')

require('states.test')
require('tests.mob')
require('tests.world')
require('tests.enemy')
require('tests.player')
require('tests.tile')


local internal_resolution = {64,64}

print("hello world")
function love.load()
  love.window.setMode(internal_resolution[1], internal_resolution[2], {resizable=false})
  _.state'test'
end

function love.update(delta)
  _.main('update', delta)
end

function love.draw()
  _.main'draw'
end
