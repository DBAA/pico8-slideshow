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

--https://twitter.com/mboffin/status/1252380861934133248
p=pset t=127m=24640 l=0r={[0]=0,1,0,1,1,0,0,1}::a:: l+=1
if (l%16==0) for i=1,7 do r[i]=flr(rnd(3)) end
f=false for x=0,t do if(pget(x,t)>0)f=true end
if(not f)p(63,t,7)
memcpy(m-64,m,8128)for x=0,t do n=0 for b=0,2 do if(pget(x-1+b,126)>0)n+=2^b
end p(x,t,r[n]*7)end check_time()flip()goto a