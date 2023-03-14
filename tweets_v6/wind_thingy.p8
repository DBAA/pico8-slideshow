pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/sourencho/status/1425115139108388865

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


t=0 ::_:: cls(13) f=circfill for j=1,3 do line(55+j-6,130,55+j-3,55,1) end f(55+1,55,14+2,1) m=-1.1 t+=0.02 if(rnd() > 0.9)m+=(rnd() > 0.5 and 0.04 or -0.04)
for i=0,8 do for n=1,2 do f(55+n+3*i,55+sin(t+0.025*i)*m*i+i*2,14-i*1.1,14+(i%2)) end end
check_time()
flip() goto _