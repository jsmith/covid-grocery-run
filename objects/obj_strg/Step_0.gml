var message = "ID: " + string(instance_id) + ", route: " + string(walking_route) + ", xy: " + string(x) + "," + string(y);
show_debug_message(message);

var x_position = x - starting_x;
var y_position = y - starting_y;
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
	// TODO next
	speed = 0;
}
