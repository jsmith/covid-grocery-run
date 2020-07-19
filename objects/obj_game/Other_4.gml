/// @description Reset room variables
hp = hp_max;
num_collected = 0;
num_total = instance_number(obj_food);
// Reset pitch

if room == rm_level0 or room == rm_level1 {
	show_debug_message("Initializing room to defaults.");
	// --------- Sound stuff
	audio_stop_all();
	audio_play_sound(snd_background_highpass, 0, true);
	audio_sound_pitch(snd_background_highpass, 1);

	game_over = false;
	displaying_game_over = false;
	displaying_game_win = false;

	view_enabled = true;
	view_set_visible(0, true);
	view_set_camera(0, global.cam);
	camera_set_view_target(view_camera[0], obj_forward);
}
