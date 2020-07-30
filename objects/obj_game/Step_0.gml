/// @description Check game over

if game_over and not displaying_game_over {
	displaying_game_over = true;
	tip = tips[covid_tip_index];
	covid_tip_index = (covid_tip_index + 1) % array_length_1d(tips);
	audio_play_sound(snd_game_over, 0, false);
	audio_stop_sound(snd_background_highpass);
	camera_set_view_target(view_camera[0], noone);
}

if play_sound {
	audio_sound_gain(snd_background_highpass, 1.4, 0);
	audio_play_sound(snd_background_highpass, 0, true);
	audio_sound_pitch(snd_background_highpass, 1 + 0.25 * (1 - hp / hp_max));
	play_sound = false;	
}