pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--https://twitter.com/Andy_Makes/status/1572244127961718788 

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

l=line::_::v=3+sin(t()/5)cls()camera(-64,-64)
for d=1,8do
srand(d)s=d*9oval(-s,-s/v,s,s/v,7)a=rnd()+t()*(.2+rnd(.5))circfill(cos(a)*s,sin(a)*s/v,3)circ(cos(a)*s,sin(a)*s/v,3,0)
end
for i=-60,60,8do
l(0,i,0,i+4,7)l(i,0,i+4,0)l(i,i/v,i+4,(i+4)/v)
end
check_time()
flip()goto _--#tweetcart #pico8