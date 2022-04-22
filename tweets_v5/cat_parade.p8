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

--https://twitter.com/tscoct/status/1462387128936112135


--#pico8 #tweetcart
f=0::🐱::cls()f+=1for j=0,8do pal(1,j+8)for i=-1,8do m=sgn(j%2-1)a=(j+f\4)%2camera(-m*f%16-i*16,-8-j*15+a)rectfill(1,1,7,4,1)rect(3,6,4,8)line(2,1,6,1,0)pset(2+m,3)pset(6+m,3)if a==0then rect(2,7,5,8)pset(2,7,1)pset(5,7)end end end check_time() flip()goto 🐱
--cat parade
