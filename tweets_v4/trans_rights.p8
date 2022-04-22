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


::w::k=t()cls(0)for x=0,127 do
o=sin(k-x*.01)*7+cos(k*.1-x*.02)*1line(x,23+o,x,o+103,12)line(x,39+o,x,o+87,14)line(x,55+o,x,o+72,7)end
x="trans rights are human rights"c={7,12,14}for i=0,#x do
o=abs(sin(k-i*.06)*6)print(sub(x,i,i),3+i*4,122-o,c[flr((k-i)%3)+1])end
check_time()
flip()goto w