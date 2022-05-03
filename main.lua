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
    draw_window()
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

    -- textboxes
    window={}
    -- add_window(32,64,64,24,{"hello world!","this is line 2"})
end
