/// @description Draw black screen and draw game win/over text

if displaying_game_win or displaying_game_over {
	var midh = surface_get_width(application_surface) / 2;
	var midv  = surface_get_height(application_surface) / 2;

	draw_set_colour(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(midh - 350, midv - 50, midh + 350, midh - 10, false);
	draw_set_alpha(1);

	var text;
	if displaying_game_win text = "Congratulations!!";
	else text = "Game Over";

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);

	draw_set_font(fnt_large);
	draw_text(midh, midv, text);

	draw_set_font(fnt_small);
	draw_text(midh, midv + 45, "Press \"r\" to restart...");
	if displaying_game_win draw_text(midh, midv + 75, "Press \"c\" to see credits...");
} else if do_transition {
	if spawn_room == rm_win {
		instance_destroy(obj_forward);
		do_transition = false;
		displaying_game_win = true;
		audio_play_sound(snd_win, 0, false);
		audio_stop_sound(snd_background_highpass);
		camera_set_view_target(view_camera[0], noone);
		exit;
	}
	
	if room != spawn_room {
		black_alpha += 0.05;
		if black_alpha >= 1 room_goto(spawn_room);
	} else {
		black_alpha -= 0.05;
		if black_alpha <= 0 do_transition = false;
	}
	
	draw_set_alpha(black_alpha);
	draw_rectangle_colour(0, 0, gui_width, gui_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);	
} else {
	draw_set_color(c_white);
	draw_text(64, 32,  global.num_collected);
}
