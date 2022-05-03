-----------------
-- UI AND JUICE
-----------------

function add_window(_x,_y,_w,_h,_txt)
    local w={x=_x,y=_y,w=_w,h=_h,txt=_txt}

    add(window,w)
    return w
end

function draw_window()
    for w in all(window) do
        local wx,wy,ww,wh = w.x,w.y,w.w,w.h
        rectfill2(wx,wy,ww,wh,1)
        rectfill2(wx+1,wy+1,ww-2,wh-2,6)
        rectfill2(wx+2,wy+2,ww-4,wh-4,1)
    end
end
