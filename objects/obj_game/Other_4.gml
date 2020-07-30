/// @description Reset room variables
hp = hp_max;
num_collected = 0;
num_total = instance_number(obj_food);

game_over = false;
displaying_game_over = false;
displaying_game_win = false;

audio_stop_sound(snd_background_highpass);
audio_stop_sound(snd_game_over);

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

level_text = "TODO";
if room == rm_level1 level_text = level_names[0];
else if room == rm_level2 level_text = level_names[1];
else if room == rm_level3 level_text = level_names[2];
else if room == rm_level4 level_text = level_names[3];
else if room == rm_level5 level_text = level_names[4];
else if room == rm_level6 level_text = level_names[5];
