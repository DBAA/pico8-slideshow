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


f=circfill
function b(u,v,a,l)local x,y,s=u+cos(a)*l,v+sin(a)*l
if(l<2)f(u,v+4,4,3)f(u+2,v,2,11)return
q+=1.5
s=.06+cos(x/50+t()/3)/l/6
for w=0,l/5 do
line(u+w,v,x+w,y,w>l/9 and 9 or 4)end
b(x,y,a-s,l-q%5)b(x,y,a+s,l-q%5)
end::★::cls()f(94,34,29,7)q=0
b(9,130,.2,22)
check_time()
flip()goto ★