pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

--https://twitter.com/trasevol_dog/status/1261302684239499265 
--@trasevol_dog twisty pillar

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

flip()
p={}n=0w=cos::_::o=t()/9memcpy(0,24576,8192)cls(3)for y=0,511 do
x=y%16s=y\16mset(x,s,y)p[s-n]={}p[s][x]=mid(x-9+s,1,15)pal(x,8+x*n,1)y/=4z=y/n+o
k=y+(z-w(o)+w(z+o)/2)/4x=64+9*w(z)f=x+32*sin(k)x-=f-32*w(k)+y%2if(x>0)pal(p[x\3.5])tline(x+f,y,f,y,2,y/9,12/x)end
flip()n=128.49
check_time()
goto _
