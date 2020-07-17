/// @description Draw Health Bar

draw_sprite(spr_health_bar_container, 0, hb_x, hb_y);
draw_sprite_stretched(spr_health_bar, 0, hb_x, hb_y, hp / hp_max * hb_width, hb_height);
