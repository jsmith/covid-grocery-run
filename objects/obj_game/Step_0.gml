/// @description Check game over

if game_over and not displaying_game_over {
	displaying_game_over = true;
	audio_play_sound(snd_game_over, 0, false);
	audio_stop_sound(snd_background_highpass);
	camera_set_view_target(view_camera[0], noone);
}
