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

--code golf
--day 05◆genuary 2021◆mboffin
s=sin c=cos d=circfill b=64 r=128
m={}for i=0,b do m[i]=rnd()end::_::cls(1)a=t()for i=0,b do x,y=(m[i]*r-a*b)%r,(m[b-i]*r-a*b)%r
line(x,y,x-2,y-2,6)d(i+c(a+i/b+.2)*8,i+s(a+.2)*8,4-32/i,i%2==0and 12or 7)d(i+c(a+i/b)*8,i+s(a)*8,4-32/i,i%2==0and 10or 7)end 
check_time()
flip()goto _--#pico8
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
