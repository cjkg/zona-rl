pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
--zona
--christopher gibilisco

--[[you're no hero. you're a stalker, a raider of the zone. you sneak past the military guards to face down strange beings and hazards to scavenge what some say are alien artifacts, left from a mysterious crash.]]

#include utils/json.lua
#include utils/fade.lua
#include utils/dtb.lua
#include utils/misc.lua

#include draws/animation/animap.lua
#include draws/draw_start.lua
#include draws/draw_game.lua
#include draws/draw_win.lua
#include draws/draw_lose.lua

#include gameplay/bump.lua
#include gameplay/moveplayer.lua
#include gameplay/step.lua

#include updates/update_start.lua
#include updates/update_game.lua
#include updates/update_win.lua
#include updates/update_lose.lua
#include updates/update_player_turn.lua

#include ui/floats.lua

#include main.lua

__gfx__
0000000009aa00000000000009aa0000000000000000000003bb0000000000000000000000000000000000000000000000000000000000000000000000000000
0000000009dd000009aa000009dd000009aa00000000000003dd000003bb00000000000000000000000000000000000000000000000000000000000000000000
00700700d9a5000709dd0000d9a5000009dd00000000000053b5000003dd00000000000000000000000000000000000000000000000000000000000000000000
00077000d9aaac77d9a50007d9aa0000d9a50000ad5aa4105334dddd53b500000000000000000000000000000000000000000000000000000000000000000000
00077000d99a0007d99aac77d99a0000d99a0000adaa94005344b5005334dddd0000000000000000000000000000000000000000000000000000000000000000
0070070004440000d444000704440000d444000099999410033300005344b5000000000000000000000000000000000000000000000000000000000000000000
0000000001010000001000000101000000100000829222e001010000010100000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000008888e8800000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000005555555066666660111111100c000c0006000600999099900000000000000000000000000000000000000000
000000000b00000003000000000000b0000000305555555066666660188888100ccccc0006666600999099900000000000000000000000000000000000000000
000000000b00000003000000000000b0000000305555555066666660188888100c000c0006000600999099900000000000000000000000000000000000000000
00000000aa000000aa000000000000aa000000aa5555555000000000188888100ccccc0006666600999099900000000000000000000000000000000000000000
000000000a0000000a000000000000a0000000a05555555000000000188888100c000c0006000600999099900000000000000000000000000000000000000000
00000600000000000000000000000000000000005555555000000600188888100ccccc0006666600999099900000000000000000000000000000000000000000
00000000000000000000000000000000000000005555555000000000111111100c000c0006000600999099900000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
03333333333333333330000003333333333000000333333330000333333330000003333333300000000000000000000000000000000000000000000000000000
03333333333333333330000003333333333000000333333330000333333330000003333333300000000000000000000000000000000000000000000000000000
03333bbbbbbbb3333330000333333333333330000bb3333330000bb3333bb0000333333333333000000000000000000000000000000000000000000000000000
03333bbbbbbbb3333330000333333333333330000bb3333330000bb3333bb0000333333333333000000000000000000000000000000000000000000000000000
0bbbb0000000033333300333333bbbbbb333333000033333300000033330000333333bbbb3333330000000000000000000000000000000000000000000000000
0bbbb0000000033333300333333bbbbbb333333000033333300000033330000333333bbbb3333330000000000000000000000000000000000000000000000000
00000000000333333bb003333bb00000033333300003333333300003333000033333300003333330000000000000000000000000000000000000000000000000
00000000000333333bb003333bb00000033333300003333333300003333000033333300003333330000000000000000000000000000000000000000000000000
000000000333333bb00003333bb00000033333300003333333333003333000033333300003333330000000000000000000000000000000000000000000000000
000000000333333bb00003333bb00000033333300003333333333003333000033333300003333330000000000000000000000000000000000000000000000000
0000000333333bb0000003333bb00000033333300003333bb3333333333000033333300003333330000000000000000000000000000000000000000000000000
0000000333333bb0000003333bb00000033333300003333bb3333333333000033333300003333330000000000000000000000000000000000000000000000000
00000333333bb000000003333bb0000003333330000333300bb33333333000033333333333333330000000000000000000000000000000000000000000000000
00000333333bb000000003333bb0000003333330000333300bb33333333000033333333333333330000000000000000000000000000000000000000000000000
000333333bb00000000003333bb000000333333000033330000bb333333000033333333333333330000000000000000000000000000000000000000000000000
000333333bb00000000003333bb000000333333000033330000bb333333000033333333333333330000000000000000000000000000000000000000000000000
0333333bb000000003300333333333333333333000033330000003333330000333333bbbb3333330000000000000000000000000000000000000000000000000
0333333bb000000003300333333333333333333000033330000003333330000333333bbbb3333330000000000000000000000000000000000000000000000000
03333333333333333330000333333333333bb0000333333bb0000333333330033333300003333330000000000000000000000000000000000000000000000000
03333333333333333330000333333333333bb0000333333bb0000333333330033333300003333330000000000000000000000000000000000000000000000000
0bbbbbbbbbbbbbbbbbb000000bbbbbbbbbb000000bbbbbbbb0000bbbbbbbb00bbbbbb0000bbbbbb0000000000000000000000000000000000000000000000000
0bbbbbbbbbbbbbbbbbb000000bbbbbbbbbb000000bbbbbbbb0000bbbbbbbb00bbbbbb0000bbbbbb0000000000000000000000000000000000000000000000000
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000033333333333333333300000033333333330000003333333300003333333300000033333333000000000000000000000000000000
00000000000000000000000033333333333333333300000033333333330000003333333300003333333300000033333333000000000000000000000000000000
0000000000000000000000003333bbbbbbbb3333330000333333333333330000bb3333330000bb3333bb00003333333333330000000000000000000000000000
0000000000000000000000003333bbbbbbbb3333330000333333333333330000bb3333330000bb3333bb00003333333333330000000000000000000000000000
000000000000000000000000bbbb0000000033333300333333bbbbbb333333000033333300000033330000333333bbbb33333300000000000000000000000000
000000000000000000000000bbbb0000000033333300333333bbbbbb333333000033333300000033330000333333bbbb33333300000000000000000000000000
0000000000000000000000000000000000333333bb003333bb000000333333000033333333000033330000333333000033333300000000000000000000000000
0000000000000000000000000000000000333333bb003333bb000000333333000033333333000033330000333333000033333300000000000000000000000000
00000000000000000000000000000000333333bb00003333bb000000333333000033333333330033330000333333000033333300000000000000000000000000
00000000000000000000000000000000333333bb00003333bb000000333333000033333333330033330000333333000033333300000000000000000000000000
000000000000000000000000000000333333bb0000003333bb00000033333300003333bb33333333330000333333000033333300000000000000000000000000
000000000000000000000000000000333333bb0000003333bb00000033333300003333bb33333333330000333333000033333300000000000000000000000000
0000000000000000000000000000333333bb000000003333bb0000003333330000333300bb333333330000333333333333333300000000000000000000000000
0000000000000000000000000000333333bb000000003333bb0000003333330000333300bb333333330000333333333333333300000000000000000000000000
00000000000000000000000000333333bb00000000003333bb000000333333000033330000bb3333330000333333333333333300000000000000000000000000
00000000000000000000000000333333bb00000000003333bb000000333333000033330000bb3333330000333333333333333300000000000000000000000000
000000000000000000000000333333bb000000003300333333333333333333000033330000003333330000333333bbbb33333300000000000000000000000000
000000000000000000000000333333bb000000003300333333333333333333000033330000003333330000333333bbbb33333300000000000000000000000000
0000000000000000000000003333333333333333330000333333333333bb0000333333bb00003333333300333333000033333300000000000000000000000000
0000000000000000000000003333333333333333330000333333333333bb0000333333bb00003333333300333333000033333300000000000000000000000000
000000000000000000000000bbbbbbbbbbbbbbbbbb000000bbbbbbbbbb000000bbbbbbbb0000bbbbbbbb00bbbbbb0000bbbbbb00000000000000000000000000
000000000000000000000000bbbbbbbbbbbbbbbbbb000000bbbbbbbbbb000000bbbbbbbb0000bbbbbbbb00bbbbbb0000bbbbbb00000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000009aaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000099aaaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000999aaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000009999aaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000099aaaa111117000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000099aaa1111171000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000099aa11111111000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000099aa11111111000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000099aa11111115000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000099aa11111155000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000099aaaa555555000000000000000000000000000000000000000000000000000000000000000000000000000077
0000000000000000000000000000000000000099aaaa555555000000000000000000000000000000000000000000000000000000000000000000000000000077
000000000000000000000000000000000000009999aa555555000000000000000000000000000000000000000000000000000000000000000000000077777777
000000000000000000000000000000000000119999aaa55555000000000000000000000000000000000000000000000000000000000000000000000077777777
00000000000000000000000000000000000111aaaaaaaa55aaa00000000000000000000000000000000000000000000000000000000000007777777777777777
00000000000000000000000000000000001111aaaaaaaa55aaaa0000000000000000000000000000000000000000000000000000000000007777777777777777
000000000000000000000000000000000111119911aaaa55aaaaa000000000000000000000000000000000000000000000000077777777777777777777777777
000000000000000000000000000000001111119911aaaa55aaaaaa00000000000000000000000000000000000000000000000077777777777777777777777777
000000000000000000000000000000011111999911aaaa55aa99aaa0000000000000000000000000000000000000007777777777777777777777777777777777
000000000000000000000000000000111111999911aaaa55aa99aaaa000000000000000000000000000000000000007777777777777777777777777777777777
00000000000000000000000000000011111199aaaa11aa55aa99aaaaa000000000000000000011cc000000777777777777777777777777777777777777777777
00000000000000000000000000000011111199aaaa11aa55aa99aaaaaa00000000000000000011cc000000777777777777777777777777777777777777777777
000000000000000000000000000000111199aaaaaa11aa555599aaaaaaaaaaaaaa9999cccccc11cc777777777777777777777777777777777777777777777777
000000000000000000000000000000111199aaaaaa11aa555599aaaaaaaaaaaaaa9999cccccc11cc777777777777777777777777777777777777777777777777
000000000000000000000000000000111199aaaaaa11aa5555aa0aaa9999999999999999111111ccffffff777777777777777777777777777777777777777777
000000000000000000000000000000111199aaaaaa11aa5555aa00aa9999999999999999111111ccffffff777777777777777777777777777777777777777777
000000000000000000000000000000111199aaaaaa99aa5555aa0000999999999999999000001111000000ffffffffff77777777777777777777777777777777
000000000000000000000000000000111199aaaaaa99aa5555aa0000000000000000000000001111000000ffffffffff77777777777777777777777777777777
00000000000000000000000000000011119999aaaa99aaaa55aa00000000000000000000000000000000000000000000ffffffffff7777777777777777777777
00000000000000000000000000000011119999aaaa99aaaa55aaa0000000000000000000000000000000000000000000ffffffffff7777777777777777777777
00000000000000000000000000000011111199aaaa99aa55aaaaa00000000000000000000000000000000000000000000000000000ffffffffff777777777777
00000000000000000000000000000011111199aaaa99aa55aaaaa00000000000000000000000000000000000000000000000000000ffffffffff777777777777
00000000000000000000000000000011111199aaaa9555aaaaa40000000000000000000000000000000000000000000000000000000000000000ffffffffff77
00000000000000000000000000000011111199aaaa9555aaaa440000000000000000000000000000000000000000000000000000000000000000ffffffffff77
000000000000000000000000000000111111999aaa444444444400000000000000000000000000000000000000000000000000000000000000000000000000ff
0000000000000000000000000000001111119999aa444444444a00000000000000000000000000000000000000000000000000000000000000000000000000ff
0000000000000000000000000000001111119999adaaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000011111d9999dddaaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000001111d9999ddddaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000111d9999ddddaaaaaaaaa000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000099a91dddaaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000099a9a1ddaaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000099a9a1ddaaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000099a111ddaaaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000099aaa1ddaa9aaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000099aaa1ddaa9aaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000099aaa1dda99aaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000099aaa1dda999aaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000099aaaaaaa999aaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000099aaaaaa9999aaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000099aaaaaaaa99aaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000099aaaaaaaa99aaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000009aaaaaaaa99aaaa0000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000009aaaaaaa99aaaa0000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000009aaaaaa99aaaa0000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000009aaaaaa99aaaa0000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000099aaaa99aaa10000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000099aaaa9911110000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001111111011110000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001111111011110000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001111111011110000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001111111011110000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001111111011110000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001111111011111000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001111111011111100000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001111111011111110000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001111111100111111000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001111111110111111000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001111111111000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001111111111100000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
3535353535353535353535353535353500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3536363636363536363636363636363500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3539303030303530303030303030303500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3530303030303530303030303030303500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3530303030303530303030303030303500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3535353a35353530303030303030303500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3536363036363a30303030303030303500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3530303030303530303030303030303500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
353030303030353a353535353535353500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
353030303030353036363636363a303500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
353a353535353530303030303035303500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3530363636363530303030303035303500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3530303030303530303030303035303500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3530303030303530303030303035303500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3530303030303530303030303035383500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3535353535353535353535353535353500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000