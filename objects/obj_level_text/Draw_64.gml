var level_text;
var index = level_index;
with obj_game {
	level_text = level_names[index];
}

draw_set_font(fnt_small);
draw_set_halign(fa_center);

var text_width = string_width(level_text);
var text_height = string_height(level_text);
var x1 = x - text_width / 2;
var x2 = x + text_width / 2;
var y1 = y - text_height / 2;
var y2 = y + text_height / 2;

hover = point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2);

if hover or level_index == global.selected_level_index draw_set_color($55CA9E);
else draw_set_color($23B27C);

draw_text(x, y, level_text);
