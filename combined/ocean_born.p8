pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--https://twitter.com/TheXandan/status/1549022201105752065

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


t=128r=0s=64l=rectfill::♥::
for i=0,t do
for j=0,t do
c=pget(i,j)if(c != 0)pset(i,j,((c-1)>4 and(c-((rnd(2)>1)and 1or 0))))end end
for j=0,5 do circfill(60+j*2,s,4,7)end
circ(s,s,r,7)l(53,60,55,68,7)l(s,s,66,56,7)
check_time()
flip()r=r<96 and r+1 or 0goto ♥