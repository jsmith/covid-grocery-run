/// @description Move Y

y -= 0.5

// IDK why but I need to add 500
if height + y - 500 < 0 {
	instance_destroy();
	game_restart();
};
