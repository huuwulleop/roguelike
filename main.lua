--------------
-- MAIN LOOP
--------------
function _init()
    time=0
    p_anim={240,241,242,243}
    _upd = update_game
    _drw = draw_game
    start_game()
end

function _update()
    time+=1
    _upd()
end

function _draw()
    _drw()
end

function start_game()
    -- player coord
    p_x = 11
    p_y = 6
end


------------
-- UPDATES
------------
function update_game()
    if btn(0) then
        p_x -= 1
    end
    if btn(1) then
        p_x += 1
    end
    if btn(2) then
        p_y -= 1
    end
    if btn(3) then
        p_y += 1
    end
end

function update_gameover()

end


----------
-- DRAWS
----------
function draw_game()
    cls(0)
    map()

    draw_spr(get_frame(p_anim),p_x*8,p_y*8)
end

function draw_gameover()

end

----------
-- TOOLS
----------
function get_frame(anim)
    return anim[flr(time/6)% #anim +1]
end

function draw_spr(_spr,_x,_y,_c)
    palt(0, false)
    pal(6, _c) --change color
    spr(_spr, _x, _y)
    pal() --reset
end