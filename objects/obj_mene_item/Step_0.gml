/// @description Increase size
focused = global.selected_menu_item == my_index;	

if mouse_over or focused {
	image_xscale = initial_scale_x * 1.2;
    image_yscale = initial_scale_y * 1.2;
} else {
	image_xscale = initial_scale_x;
    image_yscale = initial_scale_y;	
}
