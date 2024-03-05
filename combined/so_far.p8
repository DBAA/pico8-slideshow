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

--https://twitter.com/axnjaxn/status/1403114289360031751

i=2s="\014abd\n ce"z=poke::_::z(22016,8,8,8)z(24338,13,6,0,7)i%=512if(i<2)print(s,52,u,5*i)u=56+6*sin(t()/7),i>0and flip()
i+=1z(22791+i,max(ord("##³[ツわわ;;;;;;⁸⁸、]\\𝘵ろろわんれ;;;;;==?===$⁴⁴4<",i))^^59)x,y=y,rnd(128)line(x,y-8,x,y,i%64>0and max(pget(x,y)-1)or 3)
check_time()
goto _