-- MAIN LOOP
function _init()
    _upd = update_game
    _drw = draw_game
    start_game()
end

function _update()
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



-- UPDATES
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



-- DRAWS
function draw_game()
    cls(0)
    map()

    palt(0, false)
    -- change color to yel
    pal(6, 10)
    spr(240, p_x * 8, p_y * 8)
    pal()
end

function draw_gameover()

end
