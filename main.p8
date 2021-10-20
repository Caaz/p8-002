pico-8 cartridge // http://www.pico-8.com
version 33
__lua__
-- daniel caaz - 2021
-->8
-- library
#include const.lua
#include lib/vendor/unpack.lua
#include lib/table/concat.lua
#include lib/table/shift.lua
#include lib/table/merge.lua
#include lib/table/forxy.lua
#include lib/table/forall.lua
#include lib/ichor.lua
-->8
-- classes
#include class/tile.lua
#include class/world.lua
#include class/player.lua
-->8
-- states
#include states/game.lua
_.state'game'

__gfx__
00110000333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00011000333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00111100333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01111110333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00111100333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00111100333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00111100333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00100100333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44444444333333333333333333333333333333333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
44444444333333333338833333339333333b3333333aa33300000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444433333333333883333333993333bb333333aaaa3300000000000000000000000000000000000000000000000000000000000000000000000000000000
444444443333333333388333399999933bbbbbb33aaaaaa300000000000000000000000000000000000000000000000000000000000000000000000000000000
444444443333333338888883399999933bbbbbb3333aa33300000000000000000000000000000000000000000000000000000000000000000000000000000000
4444444433333333338888333333993333bb3333333aa33300000000000000000000000000000000000000000000000000000000000000000000000000000000
44444444333333333338833333339333333b3333333aa33300000000000000000000000000000000000000000000000000000000000000000000000000000000
44444444333333333333333333333333333333333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
