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

--https://twitter.com/twitonatrain/status/1484254868198113285

?"\^!5f100⬇️⬇️;;7"
cls()p={}a=128r=rnd::_::w=t()if(r()>0.9)add(p,{y=r(a)\7*7,s=r(60),t=w,i=-1})
for i in all(p)do
pos=((w-i.t)*i.s)\6if(pos>i.i)then 
i.i=pos?chr(r(a)+a),i.y,i.i*6,6
end
if(pos>a)del(p,i)end
for i=1,1500do
x,y=r(a),r(a)pset(x,y,max(pget(x,y)-1,0))end
check_time()
flip()goto _

