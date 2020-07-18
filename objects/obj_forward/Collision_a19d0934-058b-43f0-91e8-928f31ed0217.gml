/// @description Lose HP and maybe lose the game

hp = max(hp - 0.5, 0);

audio_sound_pitch(snd_background_highpass, 1 + 0.25 * (1 - hp / hp_max));

if hp == 0 {
	with obj_game game_over = true;
}
