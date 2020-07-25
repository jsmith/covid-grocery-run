/// @description Move the box

if play_next {
	show_debug_message("Showing message -> " + string(message_index));
	y -= jumps[message_index];
	if message_index == 1 audio_play_sound(snd_i_send, 0, false);
	else audio_play_sound(snd_i_receive, 0, false);
	waiting_steps = waits[message_index];
	message_index++;
	play_next = false;
} else if waiting_steps > 0 {
	waiting_steps--;
} else if message_index < 5 or (show_instructions and message_index < 9) {
	play_next = true;
}
