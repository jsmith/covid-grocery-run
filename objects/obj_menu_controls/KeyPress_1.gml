/// @description Insert description here
// You can write your code in this editor
if keyboard_check_pressed(vk_up) global.selected_menu_item = max(global.selected_menu_item - 1, 0);
else if keyboard_check_pressed(vk_down) global.selected_menu_item = min(global.selected_menu_item + 1, 3);
