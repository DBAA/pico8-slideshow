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

--https://twitter.com/CarsonKompon/status/1513329752001724417

t=0a={}g=64d=0_set_fps(60)?"\^!5f1001😐⬇️⬅️⌂:웃8☉"
::_::for I=1,2000do
X=rnd(g*2)Y=rnd(g*2)pset(X,Y,max(0,pget(X,Y)-1))end
t+=1d+=0.165if(t%9==0)add(a,{x=g,y=g,d=d})
for I=2,#a do
A=a[I]A.x+=sin(A.d)B=a[I-1]A.y+=cos(A.d)
line(B.x,B.y,A.x,A.y,9)end
if(#a>g)deli(a,1)
check_time()
flip()goto _

