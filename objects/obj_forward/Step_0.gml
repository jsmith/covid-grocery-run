/// @description Main logic
// var distance_to_person = distance_to_object(obj_strg);
// show_debug_message("Distance -> " + string(distance_to_person) + ", Direction -> " + string(direction));

// ----------- Get keyboard information first
var key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
var key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
var shift_down = keyboard_check(vk_shift);

// ----------- Determining speed logic
var spd = 0;
var img_spd = 0;
if shift_down {
	spd = spd_run;
	img_spd = img_spd_run;
} else {
	spd = spd_n;
	img_spd = img_spd_n;
};

// ----------- Get horizontal/vertical speed
var move_x = 0;
var move_y = 0;
// Only move horizontally if we are not moving vertically
move_y = (key_down - key_up) * spd;
if move_y == 0 move_x = (key_right - key_left) * spd;

// ----------- Check for transition collision
var instance = instance_place(x, y, obj_transition);
if instance != noone {
	with (obj_game) {
		spawn_room = instance.roomTarget;
		do_transition = true;
	}
};

image_speed = img_spd;
if move_x > 0 {
	sprite_index = spr_right;
} else if move_x < 0 {
	sprite_index = spr_left;
} else if move_y > 0 {
	sprite_index = spr_forward;
} else if move_y < 0 {
	sprite_index = spr_backward;
} else {
	image_index = 1;
	image_speed = 0;
}


// ----------- Collision checks
// Horizontal first
if move_x != 0 {
	if place_meeting(x + move_x, y, obj_collision) {
		repeat (true) {
			if !place_meeting(x + sign(move_x), y, obj_collision) x += sign(move_x);
			else break;
		}
		move_x = 0;
	}	
}


// Now verticle
if move_y != 0 {
	if place_meeting(x, y + move_y, obj_collision) {

		repeat (true) {
			if !place_meeting(x, y + sign(move_y), obj_collision) y += sign(move_y);
			else break;
		}
		move_y = 0;
	}	
	
}

// ----------- Finally move the player the remaining amount
x += move_x;
y += move_y;
