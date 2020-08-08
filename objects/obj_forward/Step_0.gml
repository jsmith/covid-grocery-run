/// @description Main logic
var distance_to_person = distance_to_object(obj_strg);
// show_debug_message("Distance -> " + string(distance_to_person) + ", Direction -> " + string(direction));

var is_game_over = false;
with obj_game {
	is_game_over = game_over;
}


if distance_to_person < 30 and !global.debug and !is_game_over {
	var factor = 1;
	
	if wearing_mask factor = 0.5;
	
	if !heart_beating_fast {
		audio_play_sound(snd_heart_fast, 0, true);
		heart_beating_fast = true;
	}
	
	// var nearest = instance_nearest(x, y, obj_strg);
	// var x_diff = nearest.x - x;
	// var y_diff = nearest.y - y;
	// x += -10 * sign(x_diff);
	// y += -10 * sign(y_diff);
	// audio_play_sound(snd_damage, 0, false);
	if distance_to_person < 15 {
		image_blend = make_color_hsv(359, 255, 255);	
	} else {
		image_blend = make_color_hsv(359, 128, 255);
	}
	
	with obj_game {
		if distance_to_person < 15 {
			hp = max(hp - 1 * factor, 0);
		} else {
			hp = max(hp - 0.5 * factor, 0);	
		}

		audio_sound_pitch(snd_background_highpass, 1 + 0.25 * (1 - hp / hp_max));

		if hp <= 0 {
			game_over = true;
		}

	}
} else {
	image_blend = c_white;
	
	if heart_beating_fast {
		audio_stop_sound(snd_heart_fast);
		heart_beating_fast = false;
	}
}


// ----------- Get keyboard information first
var key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
var key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));

// ----------- Determining speed logic
with obj_game {
	if game_over {
		exit;
	}
}

var spd = 0;
var img_spd = 0;
if running {
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

// ----------- Get player direction
var facing = -1;
if move_x > 0 facing = dir.right;
else if move_x < 0 facing = dir.left;
else if move_y > 0 facing = dir.down;
else if move_y < 0 facing = dir.up;

// ----------- Check for collision with items
if (
	place_meeting(x, y, obj_sanitization_station) or 
	place_meeting(x, y, obj_mask) or
	place_meeting(x, y, obj_run_powerup)
) {
	colliding_with_item = true;
	
	if keyboard_check_pressed(ord("E")) {
		if place_meeting(x, y, obj_sanitization_station) {
			audio_play_sound(snd_faucet, 0, false);
			with obj_game hp = hp_max;
			audio_sound_pitch(snd_background_highpass, 1);
		} else  if place_meeting(x, y, obj_mask) {
			// Remove it so it looks like we are picking it up
			wearing_mask = true;
			instance_destroy(obj_mask);
			
			// Kinda annoying but we need to init this or else it won't change until the player moves
			// This could definitely be refactored and combined with the other code but it's ok
			if sprite_index == spr_right {
				sprite_index = spr_right_msk;
			} else if sprite_index == spr_left {
				sprite_index = spr_left_msk;
			} else if sprite_index == spr_forward {
				sprite_index = spr_forward_msk;
			} else {
				// If backwards we don't care because you can't see their face
			}
		} else {
			audio_play_sound(snd_powerup, 0, false);
			running = true;
			instance_destroy(obj_run_powerup);	
		}
	}
} else {
	colliding_with_item = false;
};

// ----------- Check for transition collision
var instance = instance_place(x, y, obj_transition);
if instance != noone and (facing == dir.up || facing == -1) {
	var local_cannot_transition = false;
	with (obj_game) {
		// make sure that we have collected everything
		// only then can we move to the next room
		if num_total == num_collected or global.debug {
			spawn_room = room_next(room);
			do_transition = true;
		} else {
			local_cannot_transition = true;
		}
	}
	
	cannot_transition = local_cannot_transition;
} else {
	cannot_transition = false;	
}

image_speed = img_spd;
if move_x > 0 {
	if wearing_mask sprite_index = spr_right_msk else sprite_index = spr_right;
} else if move_x < 0 {
	if wearing_mask sprite_index = spr_left_msk else sprite_index = spr_left;
} else if move_y > 0 {
	if wearing_mask sprite_index = spr_forward_msk else sprite_index = spr_forward;
} else if move_y < 0 {
	// If backwards we can't see their face so we don't care
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
