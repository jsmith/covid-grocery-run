/// @description Check game commands

if keyboard_check_pressed(ord("0")) global.debug = !global.debug;
// else if keyboard_check_pressed(ord("P")) room_goto(rm_level6);
else if keyboard_check_pressed(ord("R")) and displaying_game_over room_restart();
else if keyboard_check_pressed(ord("C")) and displaying_game_win room_goto(rm_win);
else if keyboard_check_pressed(vk_escape) {
	do_transition = false;
	room_goto(rm_menu);
} else if global.debug and keyboard_check_pressed(ord("1")) room_goto(rm_tut1);
else if global.debug and keyboard_check_pressed(ord("2")) room_goto(rm_level1);
else if global.debug and keyboard_check_pressed(ord("3")) room_goto(rm_level2);
else if global.debug and keyboard_check_pressed(ord("4")) room_goto(rm_tut2);
else if global.debug and keyboard_check_pressed(ord("5")) room_goto(rm_level3);
else if global.debug and keyboard_check_pressed(ord("6")) room_goto(rm_tut3);
else if global.debug and keyboard_check_pressed(ord("7")) room_goto(rm_level4);
else if global.debug and keyboard_check_pressed(ord("8")) room_goto(rm_tut4);
else if global.debug and keyboard_check_pressed(ord("9")) room_goto(rm_level5);
else if global.debug and keyboard_check_pressed(ord("M")) room_goto(rm_level6);
else if global.debug and keyboard_check_pressed(ord("N")) room_goto(rm_level7);
