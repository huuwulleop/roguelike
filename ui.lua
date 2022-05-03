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
        -- make the text box
        local wx,wy,ww,wh = w.x,w.y,w.w,w.h
        rectfill2(wx,wy,ww,wh,0)
        rectfill2(wx+1,wy+1,ww-2,wh-2,6)
        rectfill2(wx+2,wy+2,ww-4,wh-4,0)
        wx += 4
        wy += 4
        clip(wx, wy, ww-8, wh-8)
        
        -- print text
        for i = 1, #w.txt do
            local txt = w.txt[i]
            print(txt,wx,wy,6)
            wy += 6
        end
    end
end
