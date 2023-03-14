pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- https://twitter.com/TheXandan/status/1616830174590279682

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

--Pride Ribbon
l={"<<>7>",":720",">7201","37♪","67⌂760","0672","8웃7◆☉","☉☉2😐😐","8:<","2:::"}m=0::♥::cls()n=l[flr((m/30)%10)+1]
?"\^!5f10="..n
for j=0,10 do
for i=0,128 do
o=m+i
line(j+i-1,64+i/2*cos((o-1)/30),j+i,64+i/2*cos(o/30),i/(9-#n)%#n+1)end
end
check_time()
flip()m+=.5goto ♥