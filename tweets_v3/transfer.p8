pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--https://twitter.com/gregosel/status/1391061702653972483

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


c=circfill::_::cls(11)q=sin(t()*.6)/12
for n=32,96,16 do
y=80x=n
if(n<33 and q<0)or(n>95 and q>0)then
q-=.25
x+=cos(q)*99
y+=sin(q)*99-99
end
line(n,-50,x,y,3)
c(x,y,8,0)
c(x,y-3,4,1)c(x,y-4,3,3)
c(x,y-5,1,11)c(x,y+6,1,3)
rect(x-6,96,x+6,98,3)
line(x-7,97,x+7,97)
end
check_time()
flip()goto _

