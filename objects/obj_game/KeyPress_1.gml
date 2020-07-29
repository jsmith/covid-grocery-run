/// @description Check game commands

if keyboard_check_pressed(ord("0")) global.debug = !global.debug;
else if keyboard_check_pressed(ord("P")) room_goto(rm_level6);
else if keyboard_check_pressed(ord("R")) and displaying_game_win game_restart();
else if keyboard_check_pressed(ord("R")) room_restart();
else if keyboard_check_pressed(ord("C")) and displaying_game_win room_goto(rm_win);
else if keyboard_check_pressed(vk_escape) room_goto(rm_menu);
