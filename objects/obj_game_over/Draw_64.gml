/// @description Draw Game Over

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

var midh = surface_get_width(application_surface) / 2;
var midv  = surface_get_height(application_surface) / 2;

draw_set_font(fnt_large);
draw_text(midh, midv, "Game Over");

draw_set_font(fnt_small);
draw_text(midh, midv + 45, "Press \"r\" to restart...");

camera_set_view_target(view_camera[0], noone);
