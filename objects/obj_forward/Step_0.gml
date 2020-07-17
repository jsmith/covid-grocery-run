/// @description Check close
// var distance_to_person = distance_to_object(obj_strg);
// show_debug_message("Distance -> " + string(distance_to_person) + ", Direction -> " + string(direction));

var key_right = keyboard_check(vk_right);
var key_left = keyboard_check(vk_left);
var key_up = keyboard_check(vk_up);
var key_down = keyboard_check(vk_down);

var hsp = (key_right - key_left) * 3;
var vsp = (key_down - key_up) * 3;

var bbox_side;
if hsp > 0 bbox_side = bbox_right else bbox_side = bbox_left;
if (
	tilemap_get_at_pixel(tilemap, bbox_side + hsp, bbox_top) != 0 || 
	tilemap_get_at_pixel(tilemap, bbox_side + hsp, bbox_bottom) != 0 ||
	tilemap_get_at_pixel(tilemap, bbox_side + hsp, (bbox_top + bbox_bottom) / 2) != 0
) {
	// show_debug_message("Horizontal collision! hsp -> " + string(hsp) + ", x -> " + string(x) + ", bbox_side -> " + string(bbox_side));
	if hsp > 0 x -= (bbox_side + hsp) mod 32 + 1;
	else x += 32 - ((bbox_side + hsp) mod 32);
	// show_debug_message("x is now -> " + string(x + hsp));
}

if vsp > 0 bbox_side = bbox_bottom else bbox_side = bbox_top;
if (
	tilemap_get_at_pixel(tilemap, bbox_left, bbox_side + vsp) != 0 || 
	tilemap_get_at_pixel(tilemap, bbox_right, bbox_side + vsp) != 0 ||
	tilemap_get_at_pixel(tilemap, (bbox_left + bbox_right) / 2, bbox_side + vsp) != 0
) {
	// show_debug_message("Verticle collision! vsp -> " + string(vsp) + ", y/x -> " + string(y) + "/" + string(x) + ", bbox_side -> " + string(bbox_side));
	if vsp > 0 y -= (bbox_side + vsp) mod 32 + 1;
	else y += 32 - ((bbox_side + vsp) mod 32);
	// show_debug_message("y is now -> " + string(y + vsp));
}


image_speed = 0.75;
if hsp > 0 {
	sprite_index = spr_right;
} else if hsp < 0 {
	sprite_index = spr_left;
} else if vsp > 0 {
	sprite_index = spr_forward;
} else if vsp < 0 {
	sprite_index = spr_backward;
} else {
	image_speed = 0;	
}

// Check for transition collision
var instance = instance_place(x, y, obj_transition);
if instance != noone {
	with (obj_game) {
		spawn_room = instance.roomTarget;
		do_transition = true;
	}
};

x += hsp;
y += vsp;
