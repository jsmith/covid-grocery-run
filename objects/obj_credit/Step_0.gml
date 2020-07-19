/// @description Move Y

y -= 0.5

if y == height - 0 {
	instance_destroy();
	room_goto(rm_level0);
};
