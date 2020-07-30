if keyboard_check(vk_down) global.selected_level_index = min(global.selected_level_index + 1, global.n_levels - 1);
else if keyboard_check(vk_up) global.selected_level_index = max(global.selected_level_index - 1, 0);
