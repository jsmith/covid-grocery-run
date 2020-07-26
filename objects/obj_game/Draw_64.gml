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
	} else if room != spawn_room and black_alpha <= 0 {
		// This will run *once*
		audio_play_sound(snd_cash_register, 0, false);
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
} else if room != rm_introduction and room != rm_win and room != rm_menu {
	// Set font and then calculate width
	draw_set_font(fnt_small);
	
	var level_text = "Level 1: So you need to get groceries?";
	if room == rm_level2 {
		var level_text = "Level 2: Social distancing is key";
	} else if room == rm_level3 {
		level_text = "Level 3: Bask in the mask";
	} else if room == rm_level4 {
		level_text = "Level 4: The mask is back";
	} else if room = rm_level5 {
		level_text = "Level 5: Do you even wash your hands?";
	}
	
	var collected_text = "Collected " + string(num_collected) + " / " + string(num_total) + " Items";
	
	var text_width = max(string_width(level_text), string_width(collected_text));
	
	// Now with the width we can draw the background
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(10, 10, 10 + text_width + 20, 120, false);
	draw_set_alpha(0.7);
	draw_rectangle(10, 10, 220, 70, true);
	draw_set_alpha(1);

	var hb_width = 103;
	var hb_height = 15;
	var hb_x = 20;
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	draw_text(hb_x, 20, level_text);
	draw_text(hb_x, 85, collected_text);
	draw_sprite(spr_health_bar_container, 0, hb_x, 60);
	draw_sprite_stretched(spr_health_bar, 0, hb_x, 60, hp / hp_max * hb_width, hb_height);
}
