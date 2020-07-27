/// @description Check commands
show_debug_message("i -> " + string(message_index));
if message_index == 5 && keyboard_check_pressed(ord("I")) {
	show_instructions = true;
	play_next = true;
} else if (
	keyboard_check_pressed(ord("C")) and 
	(message_index == 5 or message_index == 9)
) {
	with obj_game {
		spawn_room = room_next(room);
		do_transition = true;	
	}
} else {
	if keyboard_check_pressed(ord("E")) waiting_steps = 0;	
}
