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
#include utils/map.lua

--include draws/animation/animap.lua
#include draws/draw_start.lua
#include draws/draw_game.lua
#include draws/draw_win.lua
#include draws/draw_lose.lua
#include draws/draw_inventory.lua
#include draws/draw_use.lua 


#include gameplay/bump.lua
#include gameplay/moveplayer.lua
#include gameplay/step.lua
#include gameplay/hitmob.lua
#include gameplay/ai.lua
#include gameplay/heal.lua
#include gameplay/throw.lua

#include items/additem.lua
#include items/triguse.lua
#include items/use.lua

#include ui/floats.lua
#include ui/drawhud.lua
#include ui/inventory.lua
#include ui/use.lua

#include updates/update_start.lua
#include updates/update_game.lua
#include updates/update_win.lua
#include updates/update_lose.lua
#include updates/update_player_turn.lua
#include updates/update_ai_turn.lua
#include updates/update_inventory.lua
#include updates/button.lua
#include updates/update_use.lua
#include updates/update_stats.lua
#include updates/update_throw.lua

#include objects/entity.lua

#include main.lua

__gfx__
0000000009aa0000000000000000000003bb0000000000000000b0000a000b000088800000000000000770000000000000000000000000000008000000000000
0000000009dd000009aa00000000000003dd000003bb000000a00000000000000888e8000088800000777700000880000000000000000000000000000a000900
00700700d9a5000709dd00000000000053b5000003dd000000000a0000a000a028888e800888e8000aaaaaa000888800000ee000000880000a08090000000000
00077000d9aaac77d9a50007ad5aa4105334dddd53b500000b0a0000b000000028888880288888800aaaaaa00999999000e88e00008ee800000000000a080900
00077000d99a0007d99aac77adaa94005344b5005334dddd00000000000000002888882002888800099999900999999000e88e00008ee8000a08090000000000
0070070004440000d44400079999941003bb00005344b5000000b000000000000288820000222000009999000aaaaaa0000ee00000088000000000000a080900
000000000101000000100000829222e00101000001010000000b0a000000b00000222000000000000008800000aaaa0000000000000000000a00090000000000
00000000000000000000000008888e8800000000000000000000000000b000a00000000000000000000000000007700000000000000000000000000000080000
00000000000000007007000007007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0907090000070000000070700007a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000a0a0000707a000707a9070005555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
070a070007090700007a907007a9e7000c5c5c500055550000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000a0a00007a9e7007a9e89700055550005c5c5c000000000000000000000000000000000000000000000000000000000000000000000000000000000
09070900000700007a988a70a9e82890000000000055550000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000098289000e822200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00008000000000006660666000000000000000000000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000
00088800000000006880886088000880bb000bb0000ccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000
0088886000cccc006880886088808880bbb0bbb000cccc6000000000000000000000000000000000000000000000000000000000000000000000000000000000
088886880cddddc068808860088088000bb0bb000cccc6cc00000000000000000000000000000000000000000000000000000000000000000000000000000000
88886880000cc0006880886000080000000b0000cccc6cc000000000000000000000000000000000000000000000000000000000000000000000000000000000
088688000cddddc0688088600083800000b3b0000cc6cc0000000000000000000000000000000000000000000000000000000000000000000000000000000000
006880000cddddc0666066600003000000030000006cc00000000000000000000000000000000000000000000000000000000000000000000000000000000000
0008000000000000000000000000000000000000000c000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000ddddddd0000000000600060066606660ffffffffffffffffffffffff00000000ff656dff00cccc0000cc7c0000c7cc00000000000000000000000000
00000000ddddddd088888880066666006cc0cc60fffffffff9ffffffffffffff00000000ffd6dfff0cccccc00ccaccc00cc7ccc0000000000000000000000000
00000000ddddddd086666680060006006cc0cc60fffffffffffffffff707f7ff07070700ff6d6ff9ccccccccccac7ccc7cccaccc0000000000bbbb0000000000
00000000ddddddd086000680066666006cc0cc60fffff9ffffbfbfbf77777d7d77777d7dff565fffcccccccc7c7ac7cccaccc77c000d00000bbbbbb000000000
0000a000ddddddd006666600c60006c06cc0cc60ffffffffff33b33f7707d7df7707d7d0af666fffcccccccccaacccacccaca7c7006dd500bbbbbbbb00001000
00000000ddddddd006000600c66666c06cc0cc60fffffffffff333ffddddfddddddd0dddff5ddfffcccccccccccaccc7ccc7cacc06dd5d50bbbbbbbb00000000
00000000ddddddd006666600ccccccc066606660afffffffafffffffffffffff00000000ffd56dff0cccccc00ccc7cc00ccc7cc0655565600bbbbbb000000000
0000000000000000060006000000000000000000ffffffffffffffffffffffff00000000ff565fdf00cccc0000cc7c0000c7cc000000000000bbbb0000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000066660066666666666666666666666670000000
03333333333333333330000003333333333000000333333330000333333330000003333333300000000000000ddddd6066666666666666666666666677000000
03333333333333333330000003333333333000000333333330000333333330000003333333300000000000005dd005d666666666666666666566666677700000
03333bbbbbbbb3333330000333333333333330000bb3333330000bb3333bb0000333333333333000000000005d0000d666666666666666666566666677000000
03333bbbbbbbb3333330000333333333333330000bb3333330000bb3333bb0000333333333333000000000005d0000d666666666666666665656666670000000
0bbbb0000000033333300333333bbbbbb333333000033333300000033330000333333bbbb3333330000000005d600dd666666666666666665656666600000000
0bbbb0000000033333300333333bbbbbb333333000033333300000033330000333333bbbb33333300000000005ddddd066666666666666665656566600000000
00000000000333333bb003333bb00000033333300003333333300003333000033333300003333330000000000055550066666666665656665656566600000000
00000000000333333bb003333bb00000033333300003333333300003333000033333300003333330000000000000000055555555556565656665655500000000
000000000333333bb00003333bb00000033333300003333333333003333000033333300003333330000000000000000066666666666665656666666600000000
000000000333333bb00003333bb00000033333300003333333333003333000033333300003333330000000000000000066666666666665656666666600000000
0000000333333bb0000003333bb00000033333300003333bb3333333333000033333300003333330000000000000000066666666666666566666666600000000
0000000333333bb0000003333bb00000033333300003333bb3333333333000033333300003333330000000000000000066666666666666566666666600000000
00000333333bb000000003333bb0000003333330000333300bb33333333000033333333333333330000000000000000066666666666666666666666600000000
00000333333bb000000003333bb0000003333330000333300bb33333333000033333333333333330000000000000000066666666666666666666666600000000
000333333bb00000000003333bb000000333333000033330000bb333333000033333333333333330000000000000000066666666666666666666666600000000
000333333bb00000000003333bb000000333333000033330000bb3333330000333333333333333300000009aaaaaa00000000000000000000000000000000000
0333333bb000000003300333333333333333333000033330000003333330000333333bbbb3333330000099aaaaaaaaa000000000000000000000000000000000
0333333bb000000003300333333333333333333000033330000003333330000333333bbbb33333300009aaaaaaaaaaaa00000000000000000000000000000000
03333333333333333330000333333333333bb0000333333bb0000333333330033333300003333330009aaaaaaaaaa77aa0000000000000600000000000000600
03333333333333333330000333333333333bb0000333333bb000033333333003333330000333333009aaaaaaaaaaa77aaa0000000000dddddddddd666ddddd00
0bbbbbbbbbbbbbbbbbb000000bbbbbbbbbb000000bbbbbbbb0000bbbbbbbb00bbbbbb0000bbbbbb09aaaaaaaaaaaaaa77a0000000000ddddddddddddddddddd0
0bbbbbbbbbbbbbbbbbb000000bbbbbbbbbb000000bbbbbbbb0000bbbbbbbb00bbbbbb0000bbbbbb09aaaaaaaaaaaaaa77aa00000000011111ddddd111dddddd0
000000000000000000000000000000000000000000000000000000000000000000000000000000009aaaaaaaaaaaaaaaaaa00000000000dddd555dddddddd550
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000009aaaaaaaaaaaaaaaaaa000000000000000000d001dd11500
bbbbbb7bb7bbbbbbbbbbbbbbb777777b0000000000000000000000000000000000000000000000009aaaaaaaaaaaaaaaaaa000000000000000000d011dd11500
bbbbb77bb77bbbbbbbbbbbbbbb7777bb0000000000000000000000000000000000000000000000009aaaaaaaaaaaaaaaaaa00000000000000000005555d11500
bbbb777bb777bbbbbbbbbbbbbbb77bbb00000000000000000000000000000000000000000000000099aaaaaaaaaaaaaaaa900000000000000000000000d11500
bbbb777bb777bbbbbbb77bbbbbbbbbbb000000000000000000000000000000000000000000000000049aaaaaaaaaaaaaa9000000000000000000000000d11500
bbbbb77bb77bbbbbbb7777bbbbbbbbbb0000000000000000000000000000000000000000000000000499aaaaaaaaaaaa99000000000000000000000000d11500
bbbbbb7bb7bbbbbbb777777bbbbbbbbb00000000000000000000000000000000000000000000000000499aaaaaaaaaa990000000000000000000000000555550
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb0000000000000000000000000000000000000000000000000004999aaaaaaa9900000000000000000000000000000000
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
0000000000000303030303030303030303030303030300000000000000000000030307000003000000000000000000000005000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
3131313131313131313131313131313100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3132303030303030303030343030303100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3130303030303030303030313030303100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3130303030303030303030313030303100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3130303030303030303030313030303100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3130303030303030303030313030303100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3130303030303030302030313131343100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3130303030303030303030313030303100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3130303030303130303030313030303100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3130302130303131313131313030303100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3130303030303130303030313030303100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3130303030303130303030343030213100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3130303030303430303030313431313100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3130303030303130303030313030303100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3130303030303130303030313131333100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3131313131313131313131313131313100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
a80100000003000040000300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aa0100001972019720187201672016720157201472013720147201b7201b7201b7201272012720127200070000700007000070000700007000070000700007000070000700007000070000700007000070000700
5e0100000d6700b7700d6500b7400d6200b710146001b6001b6001960023600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600006000060000600
000100001b5501b5501b5501b5501a5501a5501a5501a5501a5501a5501a5501a5501a5501a5501a550185501a550195501955000500005000050000500005000050000500005000050000500005000050000500
000200002d0502705024050200501e0501c05019050160501405012050100500f0500c0500b0500a0500905008050080500705007050070500705007050060500605000000000000000000000000000000000000
000100002565025650256502465026650246402364024630236102365023650236002365000000226500000022650000002265023650246502565025650000000000000000000000000000000000000000000000
