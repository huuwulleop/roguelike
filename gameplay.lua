-------------
-- GAMEPLAY
-------------

function move_player(dx,dy)
    local dest_x, dest_y = p_x + dx, p_y + dy
    local tile = mget(dest_x,dest_y)

    -- flip player direction
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
        sfx(63)
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
        sfx(59)
        mset(dest_x,dest_y,1)
    elseif tile == 10 or tile == 12 then
    -- chests
        sfx(61)
        mset(dest_x,dest_y,tile - 1)
    elseif tile == 13 then
    --  doors
        sfx(62)
        mset(dest_x,dest_y,1)
    elseif tile == 6 then
    -- stone tablets
    end
end
