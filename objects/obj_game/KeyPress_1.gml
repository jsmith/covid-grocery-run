/// @description Check game commands

if keyboard_check_pressed(ord("0")) global.debug = !global.debug;
else if keyboard_check_pressed(ord("R")) and displaying_game_win game_restart();
else if keyboard_check_pressed(ord("R")) room_restart();
else if keyboard_check_pressed(ord("C")) {
	displaying_game_win = false; // If we are displayin the game win display we should remove it
	room_goto(rm_win);
}
else if keyboard_check_pressed(vk_escape) game_end();
