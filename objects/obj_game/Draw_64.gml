/// @description Draw black screen and draw game win/over text

if displaying_game_win or displaying_game_over {
	var midh = surface_get_width(application_surface) / 2;
	var midv  = surface_get_height(application_surface) / 2;
	
	var extra_height = 0;
	if displaying_game_over {
		draw_set_font(fnt_small);
		extra_height += string_height(covid_tip_title) + 70;
		draw_set_font(fnt_ex_small);
		extra_height += string_height(tip);
	}
	
	var horizontal_size;
	if displaying_game_over horizontal_size = 750 else horizontal_size = 800;
	

	draw_set_colour(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(midh - horizontal_size / 2, midv - 50, midh + horizontal_size / 2, midh - 10 + extra_height / 2, false);
	draw_set_alpha(1);

	var text;
	if displaying_game_win text = "Nice Grocery Run!!";
	else text = "Game Over";
	

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	
	var draw_y = midv;

	draw_set_font(fnt_large);
	draw_text(midh, draw_y, text);
	
	if displaying_game_over {
		draw_set_font(fnt_small);
		draw_y = draw_y + 55;
		draw_text(midh, draw_y, covid_tip_title);
		draw_set_font(fnt_ex_small);
		draw_y = draw_y + string_height(tip) / 2 + 15;
		draw_text(midh, draw_y, tip);
	}

	draw_set_font(fnt_small);
	if displaying_game_win {
		draw_text(midh, draw_y + 45, "Press \"Esc\" to quit...");
		draw_text(midh, midv + 75, "Press \"c\" to see credits...");
	} else {
		draw_text(midh, draw_y + 45, "Press \"r\" to restart \"Esc\" to quit...");
	}
} else if do_transition {
	if spawn_room == rm_win {
		instance_destroy(obj_forward);
		do_transition = false;
		displaying_game_win = true;
		audio_stop_sound(snd_background_highpass);
		audio_stop_sound(snd_heart_fast);
		audio_stop_sound(snd_heart_slow);
		audio_play_sound(snd_win, 0, false);
		camera_set_view_target(view_camera[0], noone);
		exit;
	} else if room != spawn_room and black_alpha <= 0 {
		// This will run *once*
		audio_play_sound(snd_cash_register, 0, false);
	}
	
	if room != spawn_room {
		black_alpha += 0.05;
		if black_alpha >= 1 {
			level_sleep_steps = 3 * 60;
			room_goto(spawn_room);
		}
	} else if level_sleep_steps == 0 {
		black_alpha -= 0.05;
		if black_alpha <= 0 {
			do_transition = false;
			play_sound = true;
		}
	}
	
	draw_set_alpha(black_alpha);
	draw_rectangle_colour(0, 0, gui_width, gui_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
	// Do this *after* rectangle drawing
	if level_sleep_steps < 177 and level_sleep_steps > 0 {
		var view_midw = surface_get_width(application_surface)/2;
		var view_midh  = surface_get_height(application_surface)/2;
		draw_set_font(fnt_small);
		draw_set_halign(fa_center);
		draw_set_color(c_white);
		draw_set_valign(fa_middle);
		// draw_text(view_midw, view_midh, "TESTTER");
		draw_text(view_midw, view_midh, level_text);
		level_sleep_steps--;
	} else if level_sleep_steps > 0 {
		level_sleep_steps--;
	}
} else if room != rm_introduction and room != rm_win and room != rm_menu and room != rm_levels {
	// Set font and then calculate width
	draw_set_font(fnt_small);
	
	var collected_text = "Collected " + string(num_collected) + " / " + string(num_total) + " Items";
	
	var text_width = max(string_width(level_text), string_width(collected_text));
	
	// Now with the width we can draw the background
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(10, 10, 10 + text_width + 20, 120, false);
	draw_set_alpha(0.7);
	draw_rectangle(10, 10, 220, 70, true);
	draw_set_alpha(1);

	var hb_x = 20;
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	draw_text(hb_x, 20, level_text);
	draw_text(hb_x, 55, collected_text);
}
