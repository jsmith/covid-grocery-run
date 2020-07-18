/// @description Check game over

if game_over and not displaying_game_over {
	displaying_game_over = true;
	instance_create_depth(x, y, 0, obj_game_over);
	audio_play_sound(snd_game_over, 0, false);
	audio_stop_sound(snd_background_highpass);
}
