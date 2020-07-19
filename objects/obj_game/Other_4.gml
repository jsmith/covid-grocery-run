/// @description Reset room variables
hp = hp_max;
num_collected = 0;
num_total = instance_number(obj_food);
// Reset pitch
audio_sound_pitch(snd_background_highpass, 1);