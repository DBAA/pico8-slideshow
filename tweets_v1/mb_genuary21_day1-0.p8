pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
--[[
  put this check_time function at the start of the cart
  make sure to call check_time() somehwere in the cart.
  in most tweetcarts, the bast place to do this is direclty before "flip()"
--]]
function check_time() 
  --id is stored in the parameters field
  my_id = stat(6)

  --the breadcrumb field is the name of the start cart + "," + the number of seconds we should play
  my_info = stat(100)
  --if we don't have it, stop checking
  if my_info == nil then
    return
  end

  breadcumb_parts = split(my_info, ",", true)
  start_cart_name = breadcumb_parts[1]
  max_time = breadcumb_parts[2]

  --check if we hit the max time
  if time() > max_time or btnp(1) then
    load(start_cart_name,"",my_id)
  end
end
--end of check_time

--//triple nested loop
--day 01◆genuary 2020◆mboffin

function _draw()
  check_time()
	cls()
	pal({[0]=1,5,13,12,7,7})
	for i=0,31 do
		a=i/32+t()/8
		x=64+cos(a)*48
		y=64+sin(a)*48
		circ(x,y,32,sin(a)*2+2.2)
		for j=0,15 do
			a=j/16+t()/4
			x+=cos(-a)*8
			y+=sin(-a)*8
			circ(x,y,8,sin(a)*2+2.2)
			for k=0,7 do
				a=k/8+t()/2
				x+=cos(a)*4
				y+=sin(a)*4
				circ(x,y,4,sin(a)*2+2.2)
			end
		end
	end
end

__gfx__
0000000015dc70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000053b700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
