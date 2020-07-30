if target_room == -1 {
	var i;
	target_room = rm_level1;
	for (i = 0; i < level_index; i++) {
		target_room = room_next(target_room);	
	}
}
