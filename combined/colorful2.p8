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

--https://twitter.com/alexthescott/status/1502791044810772481?s=21&t=kNEpcHyUmqR7F7PDmasn3Q


?"\^!5f10🐱2☉8웃🅾️:♥"
d=128
l,f,q,r,c,s=d*4,0,rnd(),rnd(),cos,sin cls()_set_fps(60)::_::cls()
for i=1,l do
u=i/d
v=f/l
x=(1+(c(u/4))/2)*64+c(i/l+v*q)*6+c(u+v*r)*8+c(u/2+v)*12y=(1+(s(u)/2)/2)*64+s(i/l+v*r)*6+s(u+v*q)*8+s(u/4+v/8/r)*8
circfill(x,y,2,1+x/y/0.7)end
f+=1
check_time()
flip()goto _