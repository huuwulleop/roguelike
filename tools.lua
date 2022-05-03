----------
-- TOOLS
----------
function get_frame(anim)
    return anim[flr(time/8)% #anim + 1]
end


function draw_spr(_spr,_x,_y,_c,_flip)
    palt(0,false)
    pal(6,_c) --change color
    spr(_spr,_x,_y,1,1,_flip)
    pal() --reset
end

function rectfill2(_x,_y,_w,_h,_c)
    rectfill(_x,_y,_x+_w-1,_y+_h-1,_c)
end
