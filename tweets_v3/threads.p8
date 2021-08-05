pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/gunturtle/status/1363955617224867841?s=20

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


::_::
cls()srand()line()t=time()r=rnd
u=-14pal({u,u,2,u,2,2,8,u,2,2,8,2,8,8,14},1)
for i=0,15 do
l=r()
n=r()*8+6q=r()/2+.5
f=i\4+1h=2^f-1
poke(0x5f5e,h-2^(f-1)+1+15*16)
for j =0,128 do
pset(64+sin(q*j/128+l+t/8)*n*sin(t/(i+9)+i/9)+cos(t/32+j/256)*32,j,h)
end
end
flip()
check_time()
goto _