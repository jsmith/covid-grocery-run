// var message = "ID: " + string(instance_id) + ", route: " + string(walking_route) + ", xy: " + string(x) + "," + string(y);
// show_debug_message(message);

if target_x == -1 || target_y == -1 {
	show_debug_message(string(walking_route))
	if array_height_2d(walking_route) == 0 {
		show_debug_message("Did not find walking route :(");
		target_x = 0;
		target_y = 0;
	} else {
		target_x = walking_route[0, 0];
		target_y = walking_route[0, 1];
		// show_debug_message("Init Target -> " + string(target_x) + ", " + string(target_y));
	}	
}

var x_position = x - starting_x;
var y_position = y - starting_y;

// show_debug_message(string(x_position) + ", " + string(y_position));
// var x_desired = starting_x + target_x;
// var y_desried = starting_y + target_y;

var movement_x = target_x - x_position;
var movement_y = target_y - y_position;

if movement_x != 0 {
	if movement_x < 0 {
		direction = 180;
	} else {
		direction = 0;
	}
} else if movement_y != 0 {
	if movement_y < 0 {
		direction = 90;
	} else {
		direction = 270;
	}
} else {
	// Go to next route
	route_index++;
	
	show_debug_message(string(array_height_2d(walking_route)))
	if route_index == array_height_2d(walking_route) {
		// show_debug_message("starting -> " + string(starting_y) + ", y -> " + string(y) + ", move -> " + string(starting_y - y));
		target_x = 0;
		target_y = 0;
		route_index = -1;
	} else {
		// show_debug_message("Now at " + string(y));
		target_x = walking_route[route_index, 0];
		target_y = walking_route[route_index, 1];
	}
	
	// show_debug_message("Target -> " + string(target_x) + ", " + string(target_y));
}


switch direction div 90 {
	case 0: sprite_index = spr_strg_right; break;
	case 1: sprite_index = spr_strg_backward; break;
	case 2: sprite_index = spr_strg_left; break;
	case 3: sprite_index = spr_strg_forward; break;
}
