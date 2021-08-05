pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- by @2darray

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


::_::cls(2)a=t()u=-1v=-1
for x=-20,147,2 do
d=sin((x+20)/336)y=40-d*20w=sin(a/8)*d*6x+=w
y-=w/4line(x,y,u,v,6)line(x,y+1,u,v+1,5)h=0u=x
v=y
if(d<-.8)h=20
for i=1,h do
w=sin(a/4+y/9)circ(x-i/4+w*i/5,y+i*2+sin(a/4+x/25)*i/8,3-i/19,8+i/2%3)end
end
check_time()
flip()goto _