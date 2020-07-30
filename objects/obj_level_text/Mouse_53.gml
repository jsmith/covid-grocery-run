if hover {
	var local_room = target_room;
	with obj_game {
		spawn_room = local_room;
		do_transition = true;
	}
}
