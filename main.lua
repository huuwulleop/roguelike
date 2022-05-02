--------------
-- MAIN LOOP
--------------
function _init()
    time=0
    p_anim={240,241,242,243}

    dir_x={-1,1,0,0}
    dir_y={0,0,-1,1}
    
    _upd = update_game
    _drw = draw_game
    start_game()
end

function _update60()
    time+=1
    _upd()
end

function _draw()
    _drw()
end

function start_game()
    -- player coord
    p_x, p_y = 11,6
    -- offset for move anim
    p_ox, p_oy = 0,0
    p_sox, p_soy = 0,0
    p_timer = 0
end


------------
-- UPDATES
------------
function update_game()
    for i = 0,3 do
        if btnp(i) then
            local dx,dy = dir_x[i+1],dir_y[i+1]
            p_x += dx
            p_y += dy
            p_sox, p_soy = -dx*8, -dy*8
            p_ox, p_oy = p_sox, p_soy
            p_timer = 0 -- reset timer
            _upd = update_pturn
            return
        end
    end
end

-- move anim
function update_pturn()
    p_timer = min(p_timer + 0.2, 1)

    p_ox = p_sox * (1 - p_timer)
    p_oy = p_soy * (1 - p_timer)

    if p_timer == 1 then
        _upd=update_game
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

    draw_spr(get_frame(p_anim), p_x * 8 + p_ox, p_y * 8 + p_oy, 10)
end

function draw_gameover()

end

----------
-- TOOLS
----------
function get_frame(anim)
    return anim[flr(time/8)% #anim + 1]
end

function draw_spr(_spr,_x,_y,_c)
    palt(0,false)
    pal(6,_c) --change color
    spr(_spr,_x,_y)
    pal() --reset
end