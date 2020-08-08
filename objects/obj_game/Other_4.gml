/// @description Reset room variables
hp = hp_init;
hp_init = hp_max;
num_collected = 0;
num_total = instance_number(obj_food);

game_over = false;
displaying_game_over = false;
displaying_game_win = false;

audio_stop_sound(snd_background_highpass);
audio_stop_sound(snd_game_over);
audio_stop_sound(snd_heart_fast);
audio_stop_sound(snd_heart_slow);

if room != rm_menu and room != rm_introduction and room != rm_win and room != rm_levels {
	show_debug_message("Initializing room to defaults.");
	view_enabled = true;
	view_set_visible(0, true);
	view_set_camera(0, global.cam);
	camera_set_view_target(view_camera[0], obj_forward);
	
	if not do_transition {
		play_sound = true;
	}
}

show_debug_message(room);
level_text = "TODO";
if room >= 3 and room < 3 + global.n_levels {
	level_text = level_names[room - 3];	
}
