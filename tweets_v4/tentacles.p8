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


_p={9,137,136,2,141,12,140,1,129,131,3,139,11,138,10,135}for i,c in pairs(_p) do
pal(i-1,c,1)end
cm=0
::w::
cm+=1
cls(8)
st=t()
for b=0,2 do
for i=1,190 do
x=b*30
j=x+i
k=40+b*40-20+sin(i*.02+st*.2)*(3+b*5)
w=i*.3
circ(j,k,w,i*cos(st*.05)+cm)pset(j-w*.7,k-w*.7,cm)end
end
check_time()
flip()goto w