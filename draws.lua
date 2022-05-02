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
