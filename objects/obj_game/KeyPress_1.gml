/// @description Check game commands

if keyboard_check_pressed(ord("0")) global.debug = !global.debug;
else if keyboard_check_pressed(ord("R")) and (displaying_game_win or room == rm_win) game_restart();
else if keyboard_check_pressed(ord("R")) room_restart();
else if keyboard_check_pressed(vk_escape) room_goto(rm_menu);
