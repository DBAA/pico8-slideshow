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

l=0::_::f=0 for i=0,127 do
if(pget(i,127)>0)f=1
end if(f==0)pset(63,127,7)
if (l%16==0) then r={0}for i=1,7 do add(r,flr(rnd(2.3))) end end l+=1
memcpy(0x6000,0x6040,0x1fc0)for x=0,127 do n=0 for b=0,2 do
if (pget(x-1+b,126)>0)n+=2^b
end pset(x,127,r[1+n]*7) end
check_time()
flip()goto _
