draw_self();

var hb_width = 67;
var hb_height = 10;
var hb_x = x - 18; // 18 was just from trial and error
var hb_y = y - 20;
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_sprite(spr_health_bar_container, 0, hb_x, hb_y);
with obj_game {
	draw_sprite_stretched(spr_health_bar, 0, hb_x + 1, hb_y, hp / hp_max * hb_width, hb_height);
}
