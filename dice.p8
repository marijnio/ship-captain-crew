pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
player = { dice = {}  }

function player:new (o)
 o = o or {}
 self.__index = self
 setmetatable(o, self)
 return o
end

game = {}

function roll_die()
	return flr(rnd(6) + 1)
end

function contains(h,n)
 r = false
 for i, v in pairs(hand) do
  if v == n then
   r = true
  end
 end
 return r
end

function _init()
 
end

function _update()
 if btnp(❎) then
  if #player.dice == 0 then
	  local i = 0
	  while i < 5 do
	   add(player.dice, roll_die())
	   i += 1
	   printh("adding die...")
	  end
	 else
	  -- handle rest
	 end
	 
 end
end

function draw_die(n,x,y)
 spr(n,x,y)
end

function draw_dice(d,x,y)
 for i, v in pairs(d) do
  draw_die(v,x,y)
  x=x+10
 end
end

function _draw()
 cls()
 
 draw_dice(player.dice,10,10)
 
 print(player.stage,10,20)
end
__gfx__
00000000077777700777777007777770077777700777777007777770000000000000000000000000000000000000000000000000000000000000000000000000
00000000777777777777777770077777700770077007700770077007000000000000000000000000000000000000000000000000000000000000000000000000
00700700777777777700777770077777700770077007700770077007000000000000000000000000000000000000000000000000000000000000000000000000
00077000777887777700777777788777777777777778877778877887000000000000000000000000000000000000000000000000000000000000000000000000
00077000777887777777007777788777777777777778877778877887000000000000000000000000000000000000000000000000000000000000000000000000
00700700777777777777007777777007700770077007700770077007000000000000000000000000000000000000000000000000000000000000000000000000
00000000777777777777777777777007700770077007700770077007000000000000000000000000000000000000000000000000000000000000000000000000
00000000077777700777777007777770077777700777777007777770000000000000000000000000000000000000000000000000000000000000000000000000