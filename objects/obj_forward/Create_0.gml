/// @description Init instance variables
image_speed = 0;
image_index = 1;
direction = 270;

// Movement variables
spd_n = 2; // speed normal
spd_run = 2.6; // speed run
img_spd_n = 0.65;
img_spd_run = 0.8;
running = false;

// -------- Collision stuff
colliding_with_item = false;
wearing_mask = false;
cannot_transition = false;

// -------- Sound heart stuff
heart_beating_fast = false;
