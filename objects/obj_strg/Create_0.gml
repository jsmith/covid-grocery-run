if random(1) > 0.5 {
	sprte_to_draw = spr_strg2_forward;
}

direction = 270;
speed = 1;

starting_x = x;
starting_y = y;

if array_length_1d(walking_route) == 0 {
	show_debug_message("Did not find walking route :(");
	target_x = 0;
	target_y = 0;
} else {
	target_x = walking_route[0, 0];
	target_y = walking_route[0, 1];
	show_debug_message(
		"Found walking route!! { target_x: " + 
		string(target_x) + 
		" target_y: " +
		string(target_y) + 
		"}");
}
