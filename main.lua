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
    button_buffer = -1
    -- player start coord
    p_x, p_y = 14,6
    -- offset for move anim
    p_ox, p_oy = 0,0
    p_sox, p_soy = 0,0
    p_mov = nil
    
    p_timer = 0
    -- flipping
    p_flip = false
    -- direction
    p_dir = 0
end


------------
-- UPDATES
------------
function update_game()
    if button_buffer == -1 then
        button_buffer = get_button()
    end
    do_button(button_buffer)
    button_buffer = -1
end

-- move anim
function update_pturn()
    if button_buffer == -1 then
        button_buffer = get_button()
    end
    -- change speed
    p_timer = min(p_timer + 0.2, 1)

    p_mov()

    if p_timer == 1 then
        _upd=update_game
    end
end

function update_gameover()

end

function mov_walk()
    p_ox = p_sox * (1 - p_timer)
    p_oy = p_soy * (1 - p_timer)
end

-- bump against walls
function mov_bump()
    local time = p_timer

    if p_timer > 0.5 then
        time = 1 - p_timer
    end
    p_ox = p_sox * (time)
    p_oy = p_soy * (time)
end

function get_button()
    for i = 0,5 do
        if btnp(i) then
            return i
        end
    end
    return -1
end

function do_button(button)
    if button < 0 then return end

    if button >= 0 and button < 4 then
        move_player(dir_x[button+1], dir_y[button+1])
        return
    end
    -- TODO: Menu buttons
end


----------
-- DRAWS
----------
function draw_game()
    cls(0)
    map()

    draw_spr(get_frame(p_anim), p_x * 8 + p_ox, p_y * 8 + p_oy, 10, p_flip)
end

function draw_gameover()

end


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


-------------
-- GAMEPLAY
-------------

function move_player(dx,dy)
    local dest_x, dest_y = p_x + dx, p_y + dy
    local tile = mget(dest_x,dest_y)

    if dx < 0 then
        p_flip = true
    elseif dx > 0 then
        p_flip = false
    end

    -- check passability
    if fget(tile,0) == true then
        p_sox, p_soy = dx*8, dy*8
        p_ox, p_oy = 0,0
        p_timer = 0 -- reset timer

        _upd = update_pturn
        p_mov = mov_bump

        -- interact with objects
        if fget(tile, 1) then
            trigger_bump(tile,dest_x,dest_y)
        end
        
    else
        p_x += dx
        p_y += dy

        p_sox, p_soy = -dx*8, -dy*8
        p_ox, p_oy = p_sox, p_soy
        p_timer = 0 -- reset timer

        _upd = update_pturn
        p_mov = mov_walk
    end
end

function trigger_bump(tile,dest_x,dest_y)
    if tile == 7 or tile == 8 then
    -- vases
        mset(dest_x,dest_y,1)
    elseif tile == 10 or tile == 12 then
    -- chests
        mset(dest_x,dest_y,tile - 1)
    elseif tile == 13 then
    --  doors
        mset(dest_x,dest_y,1)
    end
end
