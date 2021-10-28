pico-8 cartridge // http://www.pico-8.com
version 33
__lua__
-- daniel caaz - 2021
-- https://github.com/Caaz/p8-002
-->8
-- library
#include const.lua
#include lib/vendor/unpack.lua
#include lib/vendor/sort.lua
-- #include lib/vendor/pow.lua
#include lib/table/contains.lua
#include lib/table/concat.lua
#include lib/table/shift.lua
#include lib/table/merge.lua
#include lib/table/forxy.lua
#include lib/table/forall.lua
#include lib/ichor.lua
#include lib/camera.lua
#include lib/debug.lua
-->8
-- classes
#include helpers.lua
#include class/mob.lua
#include class/timer.lua
#include class/enemy.lua
#include class/tile.lua
#include class/world.lua
#include class/player.lua
-->8
-- states
#include states/game.lua
_.state'game'
-->8
-- tests
-- #include states/test.lua
-- #include tests/mob.lua
-- #include tests/world.lua
-- #include tests/enemy.lua
-- #include tests/player.lua
-- #include tests/tile.lua
-- _.state'test'

-- #include lib/vendor/putaflipinit.lua
__gfx__
00110000000880000066660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00011000008888000500005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00111100085885806000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01111110088888806007700600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00111100022882206007700600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00111100028228206000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00111100002882000500005000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00100100000000000066660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333444444443333333333333333333333333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333444444443333333333333333333333333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333444444443333333333833833333aa333333bb33300000000000000000000000000000000000000000000000000000000000000000000000000000000
3333333344444444333bb3333338833333aa333333bbbb3300000000000000000000000000000000000000000000000000000000000000000000000000000000
3333333344444444333bb3333338833333aa333333b33b3300000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333444444443333333333833833333aa3333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333444444443333333333333333333333333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333444444443333333333333333333333333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
