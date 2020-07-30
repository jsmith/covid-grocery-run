with obj_game {
	if do_transition {
		exit;
	}
}

draw_set_font(fnt_small);
draw_set_halign(fa_center);
draw_set_color($23B27C);
draw_text(x, y, "Press \"Esc\" to return to the main menu...");
