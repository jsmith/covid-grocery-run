show_debug_message("Init walking routes!!");
global.walking_route_1[0, 0] = 0;
global.walking_route_1[0, 1] = 100;
global.cam = camera_create_view(0, 0, 704, 528, 0, obj_forward, -1, -1, 100, 100); 
room_goto_next();
