-- MAIN LOOP
function _init()
    _upd = update_game
    _drw = draw_game
end

function _update()
    _upd()
end

function _draw()
    _drw()
end

function start_game()
    p_x = 11
    p_y = 6
end



-- UPDATES
function update_game()
    cls(0)
    map()
end

function update_gameover()

end



-- DRAWS
function draw_game()

end

function draw_gameover()

end
