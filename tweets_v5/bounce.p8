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

-- https://twitter.com/Theoremnd/status/1311687673745203205


--#pico8 #tweetcart #tweetjam
d=0h=34 a=0v=1.08w=33
::_::cls()srand()n=t()/4
a=abs(d)*d h+=a/40d+=1
if(h>96) d=-d+2 h=96
w+=v
if(w>96or w<32)v=-v
for k=0,999 do
i=rnd()j=rnd()/2
y=h+sin(i+n)*32*sin(j)
x=w+cos(j)*32
if(cos(i+n)<0)pset(x,y,14)else pset(x,y,2)
end
check_time()
flip()goto _