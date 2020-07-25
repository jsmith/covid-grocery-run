/// @description Reset room variables
hp = hp_max;
num_collected = 0;
num_total = instance_number(obj_food);

game_over = false;
displaying_game_over = false;
displaying_game_win = false;

audio_stop_sound(snd_background_highpass);

if room != rm_menu and room != rm_introduction and room != rm_win {
	show_debug_message("Initializing room to defaults.");
	// --------- Sound stuff
	audio_sound_gain(snd_background_highpass, 1.4, 0);
	// audio_play_sound(snd_background_highpass, 0, true);
	audio_sound_pitch(snd_background_highpass, 1);

	view_enabled = true;
	view_set_visible(0, true);
	view_set_camera(0, global.cam);
	camera_set_view_target(view_camera[0], obj_forward);
}
