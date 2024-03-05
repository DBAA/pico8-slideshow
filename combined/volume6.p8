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

  cls()
flip()

z=129pal({z,1,140,6,13,134,5,7,12},1)s="#tweetcart gallery 6"u=0r=rnd
cls()::_::l=t()*3for i=z+sgn(u-l)*z,l do
a=i/21
?"\^t\^w"..s[i],61+cos(a)*50*sgn(i-11),60+sin(a)*50,min(9,l-i+8)
circ(64,64,u)end
x=r(z)y=r(z)v=pget(x,y)u=l
if(v<9and v>0)pset(x+r(4)-2,y+r(4)-2,v-1)
check_time()
goto _

