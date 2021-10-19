pico-8 cartridge // http://www.pico-8.com
version 33
__lua__
-- daniel caaz - 2021
-->8
-- library
#include const.lua
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
00000000333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333333333333333333333333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3338833333339333333aa333333b3333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
333883333333993333aaaa3333bb3333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33388333399999933aaaaaa33bbbbbb3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3888888339999993333aa3333bbbbbb3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3388883333339933333aa33333bb3333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3338833333339333333aa333333b3333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333333333333333333333333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
