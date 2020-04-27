pico-8 cartridge // http://www.pico-8.com
version 22
__lua__
player = {
 bank = {},
 turns = 3
}

dice = {}

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

--returns whether given table
--contains element x
function contains(t,x)
 for k, v in pairs(t) do
  if v == x then
   return true
  end
 end
 return false
end

--search for x in t and bank
--it in b, only once
function search_and_bank(t,b,x)
	for k,v in pairs(t) do
	 if v==x then
	  --found it, so add it to bank
	  add(b, v)
	  --remove it from t
	  t[k] = nil
	  --stop
	  break
	 end		 
	end
end

function _init()
   printh("init") 
end

function _update()
 if btnp(❎) then
  dice = {}
  
  local i = 0
  while i < 5-#player.bank do
   add(dice, roll_die())
   i += 1
  end
  
  --determine which die to
  --search for first
	 i = 6-#player.bank
	 
	 --continue until 4 is banked
	 while i >= 4 do
	 
	  --break if alread in bank
	  if (contains(player.bank, i)) then break end
	  --break if not allowed yet
	  if i!=6 then
 	  if contains(player.bank, i+1) == false then break end
	  end
	  
	  --bank i if you can find it
	  search_and_bank(dice,player.bank,i)
	    
   i-=1
	 end

  player.turns-=1
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
 
 draw_dice(player.bank,10,10)
 draw_dice(dice,10,20)
 
 print(tostr(player.turns) .. " turns left",10,30)
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
