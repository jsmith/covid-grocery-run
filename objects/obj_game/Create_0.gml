/// @description Init game
show_debug_message("Init game!!");

// --------- Just kinda useful
enum dir {
	right = 0,
	up = 90,
	left = 180,
	down = 270,
}

// --------- Game over variables
game_over = false;
displaying_game_over = false;
displaying_game_win = false;

// --------- Transition variables
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
black_alpha = 0;
spawn_room = -1;
do_transition = false;

// --------- Global stuff
global.walking_route_down_100[0, 0] = 0;
global.walking_route_down_100[0, 1] = 100;
global.walking_route_up_100[0, 0] = 0;
global.walking_route_up_100[0, 1] = -100;
global.walking_route_right_up_100[0, 0] = 100;
global.walking_route_right_up_100[0, 1] = 0;
global.walking_route_right_up_100[1, 0] = 100;
global.walking_route_right_up_100[1, 1] = -100;
global.walking_route_right_up_100[2, 0] = 100;
global.walking_route_right_up_100[2, 1] = 0;
global.cam = camera_create_view(0, 0, 704, 528, 0, obj_forward, -1, -1, 300, 300);
global.debug = false;

// --------- Health variables
hp = 50;
hp_max = 50;

// --------- Score stuff
num_collected = 0;

// --------- DONE!
room_goto_next();
