pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

--todo:
--skip button

--baisc info
time_to_show_carts = 60
time_to_show_info = 8

explainer_time = 10
chance_to_show_explainer = 0.10

my_name = "start" --this needs to match the name of this file but without ".p8"

folder_name = "carts/" --name of the folder with the carts. should be adjacent to this file

--cart info
  --id is the name of the file that will be loaded (without ".p8")
  --name is the display anme for the project
  --creator is the twitter handle
order = { 
  {
    id="a",
    name="noodles",
    creator="@andy_makes"
  },
  {
    id="mb_genuary21day5-0",
    name="genuary21 day5",
    creator="@mboffin"
  },
  {
    id="wave_ribbons",
    name="wave ribbons",
    creator="@andy_makes"
  },
  {
    id="fuzzy",
    name="untitled",
    creator="alex mckendry"
  },
  
  {
    id="cellular_automata",
    name="automata",
    creator="@mboffin"
  },
  {
    id="breathe",
    name="breathe",
    creator="@gateeighteight"
  },
  {
    id="the_big_crunch",
    name="the big crunch",
    creator="@gateeighteight"
  },
  {
    id="3d-helix",
    name="3d helix",
    creator="@p01"
  },
  {
    id="3d-helix",
    name="3d helix",
    creator="@p01"
  },
  {
    id="tweet_2020-08-27",
    name="ghost lights",
    creator="@andy_makes"
  },
  {
    id="b",
    name="torus knot",
    creator="@p01"
  },
  {
    id="mb_genuary21_day1-0",
    name="genuary21 day1",
    creator="@mboffin"
  },
  {
    id="discotech",
    name="discotech",
    creator="@abemassry"
  },
  {
    id="voxel-landscape",
    name="voxel landscape",
    creator="@p01"
  }
}

--other stuff
text_h = 6

show_explainer = false
explainer_frame = 0


function _init()

  --figure out where we are
  cur_id = stat(6)

  cur_id_num = 2
  for i=1,#order do 
    if cur_id == order[i].id then
      cur_id_num = i
    end
  end

  next_id_num = cur_id_num + 1
  if next_id_num > #order then
    next_id_num = 1
  end

  printh("cur id "..cur_id_num)

  --time to give an explainer?
  if rnd(1) < chance_to_show_explainer then
    show_explainer = true
    time_to_show_info += explainer_time --if we're doing the explainer add that time
  end

end

function load_next()
  --passing info to the thing we are opening by using the breadcrumb and parameter fields
    --https://pico-8.fandom.com/wiki/load
    filename = folder_name..order[next_id_num].id..".p8"
    breadcrumb = my_name..","..tostring(time_to_show_carts)
    parameters = order[next_id_num].id
    load(filename, breadcrumb, parameters)
end

function _update()
  if btnp(1) then
    load_next()
  end

  if time() > time_to_show_info then
    load_next()
  end

  if show_explainer and time() > explainer_time then
    show_explainer = false
  end
end

function _draw()
  if show_explainer then
    draw_explainer()
  else
   draw_credits()
  end
end

function draw_credits()
  cls(0)
  color(7)

  local left_x = 2
  local right_x = 126
  local y_pos = 8
  local text_col = 7

  --just played
  print("that was", left_x,y_pos, text_col)
  y_pos += text_h+1
  print_big( order[cur_id_num].name, left_x, y_pos, text_col)
  y_pos += text_h * 2 
  print("by", left_x,y_pos, text_col)
  y_pos += text_h+1
  print_big( order[cur_id_num].creator, left_x, y_pos, text_col)

  --coming up 
  y_pos = 127 - text_h * 6 - 2
  print("next up", right_x-text_width("next up"), y_pos, text_col)
  y_pos += text_h+1
  print_big( order[next_id_num].name, right_x+1-text_width(order[next_id_num].name)*2, y_pos, text_col)
  y_pos += text_h * 2 
  print("by", right_x-text_width("by"), y_pos, text_col)
  y_pos += text_h+1
  print_big(order[next_id_num].creator, right_x+1-text_width(order[next_id_num].creator)*2, y_pos, text_col)

  --wonderville
  local bar_name = {"w","o","n","d","e","r","v","i","l","l","e"}
  local bar_y = 66-text_h
  local bar_left_x = 64-(text_width("wonderville")*2)/2
  local speed = 3;
  for i=1,#bar_name do
  local adjusted_time = (time()*speed) % (#bar_name+2)
    local this_x = bar_left_x + (i-1) * 8
    local this_y = bar_y
    local this_col = 2
    if flr( adjusted_time ) == i then
      this_col = 3
    end
    if flr( adjusted_time ) == i or flr( adjusted_time ) == i+1 then
      this_y += sin(abs( (adjusted_time-i)/2)) * 5
    end
    print_big(bar_name[i], this_x, this_y, this_col)
  end
end

function draw_explainer()
  explainer_frame += 1
  cls(0)
  color(7)

  local what_is_x = 64-(text_width("what is a"))/2
  print("what is a", what_is_x,2)

  local tweetcart_x = 64-(text_width("tweetcart?")*2)/2
  print_big("tweetcart?", tweetcart_x,9, 7)

  local text_lines = {
    "a tweetcart is a twitter-length",
    "program written in pico-8.",
    "",
    "a whole visualization in",
    "just 280 chars!",
    "",
    "submitted by community members",
  }
  for i=1, #text_lines do
    print(text_lines[i], 0,24+6*i)
  end

  --a little swirl underneath
  local end_step = explainer_frame * .5
  for c=0,end_step,0.1 do
    local r = 100
    local a = c * -.05
    for d=1,5 do
      local dist = (3+d*2)
      local x = c + sin(a) * dist
      local y = r + cos(a) * dist
      local col = 2
      if(d==3)  col = 3
      pset(x,y,col)
    end
  end

end

function print_big(text, x, y, text_col)

  size = {
    x = text_width(text) * 2,
    y = text_h * 2
  }
  
  print(text,x,y, text_col)

  for c=size.x, 0, -1 do
    for r=size.y, 0, -1 do
      local src_x = x + flr(c/2)
      local src_y = y + flr(r/2)
      local target_x = x + c 
      local target_y = y + r
      local src_col = pget(src_x, src_y)
      pset(target_x,target_y, src_col)
    end
  end



end

function text_width(text)
  return #text * 4
end
