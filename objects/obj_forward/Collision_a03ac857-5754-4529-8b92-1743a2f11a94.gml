/// @description Increment score, play audio and remove food
// You can write your code in this editor

with obj_game {
	num_collected += 1;	
}

audio_play_sound(snd_boop, 0, false);
instance_destroy(other);
