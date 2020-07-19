/// @description Draw collision text

if colliding_with_item {
	var x_text = surface_get_width(application_surface) / 2;
	var y_text  = surface_get_height(application_surface) - 150;
	
	draw_set_colour(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(x_text - 140, y_text - 120, x_text + 140, y_text - 70, false);
	draw_set_alpha(1);

	draw_set_halign(fa_center);
	draw_set_color(c_white);

	draw_set_font(fnt_ex_small);
	draw_text(x_text, x_text, "Press \"e\" to interact...");
}
