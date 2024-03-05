pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/von_rostock/status/1410393019921178626

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

pal({-15,1,-13,3,-5,11,-6,-9,10},1)::_::cls(1)srand()for j=0,255,5do
z=rnd()x=z*144-16y=(j+t()*16)&255for i=1,16do
a=sin(rnd()/5+t()/2+z+i/9)*i/500*(1+j/256)for h=1,3do
b=a-({15,-5,5})[h]/99d=4+h\3*3u=x+d*sin(b)v=y-d*cos(b)line(x,y,u,v,i*j/512+2)end
x=u
y=v
end
end
check_time()
flip()goto _