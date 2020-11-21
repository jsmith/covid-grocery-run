// var message = "ID: " + string(instance_id) + ", route: " + string(walking_route) + ", xy: " + string(x) + "," + string(y);
// show_debug_message(message);

if walking_route == -1 {
	speed = 0;
	image_speed = 0;
	// Show the standing still (not walking) image
	image_index = 1;
}

if target_x == -1 or target_y == -1 {
	if walking_route == -1 or array_height_2d(walking_route) == 0 {
		show_debug_message("Did not find walking route!");
		target_x = 0;
		target_y = 0;
	} else if route_index == -1 {
		target_x = walking_route[0, 0] * walking_route_scale * walking_route_scale_x;
		target_y = walking_route[0, 1] * walking_route_scale * walking_route_scale_y;
		route_index = 0;
		// show_debug_message("Init Target -> " + string(target_x) + ", " + string(target_y));
	} else {
		target_x = walking_route[route_index, 0] * walking_route_scale * walking_route_scale_x;
		target_y = walking_route[route_index, 1] * walking_route_scale * walking_route_scale_y;
		starting_x = x - target_x;
		starting_y = y - target_y;
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
	
	if walking_route == -1 or route_index == array_height_2d(walking_route) {
		// show_debug_message("starting -> " + string(starting_y) + ", y -> " + string(y) + ", move -> " + string(starting_y - y));
		target_x = 0;
		target_y = 0;
		route_index = -1;
	} else {
		// show_debug_message("Now at " + string(y));
		target_x = walking_route[route_index, 0] * walking_route_scale * walking_route_scale_x;
		target_y = walking_route[route_index, 1] * walking_route_scale * walking_route_scale_y;
	}
	
	// show_debug_message("Target -> " + string(target_x) + ", " + string(target_y));
}

switch direction div 90 {
	case 0: if draw_two sprite_index = spr_strg2_right else sprite_index = spr_strg_right; break;
	case 1: if draw_two sprite_index = spr_strg2_backward else sprite_index = spr_strg_backward; break;
	case 2: if draw_two sprite_index = spr_strg2_left else sprite_index = spr_strg_left; break;
	case 3: if draw_two sprite_index = spr_strg2_forward else sprite_index = spr_strg_forward; break;
}

step_counter = (step_counter + 1) % 60;
if step_counter mod 4 == 0 {
	var upper = 38;
	var mid = 18;
	var lower = 5;
	if random(1) < 0.4 {
		var xx = 0;
		if random(1) < 0.5 xx = random_range(-(mid + 3), -lower);
		else xx = random_range((mid + 3), lower);
		
		var yy = 0;
		if random(1) < 0.5 yy = random_range(-(mid + 3), -lower);
		else yy = random_range((mid + 3), lower);
		
		instance_create_layer(x + xx - 5, y + yy, "Items", obj_dust_large);
	} else {
		var xx = 0;
		if random(1) < 0.5 xx = random_range(-upper, -(mid - 3));
		else xx = random_range(upper, (mid - 3));
		
		var yy = 0;
		if random(1) < 0.5 yy = random_range(-upper, -(mid - 3));
		else yy = random_range(upper, (mid - 3));
		
		instance_create_layer(x + xx - 5, y + yy, "Items", obj_dust);
	}
	
}
