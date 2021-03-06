/// @description Init game
show_debug_message("Init game!!");

// --------- Just kinda useful
enum dir {
	right = 0,
	up = 90,
	left = 180,
	down = 270,
}

// --------- Game over variables
game_over = false;
displaying_game_over = false;
displaying_game_win = false;

// --------- Transition variables
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
black_alpha = 0;
spawn_room = -1;
do_transition = false;

// --------- Global stuff
global.n_levels = 11;

global.walking_route_down_100[0, 0] = 0;
global.walking_route_down_100[0, 1] = 100;
global.walking_route_up_100[0, 0] = 0;
global.walking_route_up_100[0, 1] = -100;
global.walking_route_right_100[0, 0] = 100;
global.walking_route_right_100[0, 1] = 0;
global.walking_route_left_100[0, 0] = -100;
global.walking_route_left_100[0, 1] = 0;

global.walking_route_right_up_100[0, 0] = 100;
global.walking_route_right_up_100[0, 1] = 0;
global.walking_route_right_up_100[1, 0] = 100;
global.walking_route_right_up_100[1, 1] = -100;
global.walking_route_right_up_100[2, 0] = 100;
global.walking_route_right_up_100[2, 1] = 0;

global.walking_route_left_up_100[0, 0] = -100;
global.walking_route_left_up_100[0, 1] = 0;
global.walking_route_left_up_100[1, 0] = -100;
global.walking_route_left_up_100[1, 1] = -100;
global.walking_route_left_up_100[2, 0] = -100;
global.walking_route_left_up_100[2, 1] = 0;

global.walking_route_left_down_100[0, 0] = -100;
global.walking_route_left_down_100[0, 1] = 0;
global.walking_route_left_down_100[1, 0] = -100;
global.walking_route_left_down_100[1, 1] = 100;
global.walking_route_left_down_100[2, 0] = -100;
global.walking_route_left_down_100[2, 1] = 0;

global.walking_route_right_down_100[0, 0] = 100;
global.walking_route_right_down_100[0, 1] = 0;
global.walking_route_right_down_100[1, 0] = 100;
global.walking_route_right_down_100[1, 1] = 100;
global.walking_route_right_down_100[2, 0] = 100;
global.walking_route_right_down_100[2, 1] = 0;

global.walking_route_up_right_100[0, 0] = 0;
global.walking_route_up_right_100[0, 1] = -100;
global.walking_route_up_right_100[1, 0] = 100;
global.walking_route_up_right_100[1, 1] = -100;
global.walking_route_up_right_100[2, 0] = 0;
global.walking_route_up_right_100[2, 1] = -100;

global.walking_route_down_right_100[0, 0] = 0;
global.walking_route_down_right_100[0, 1] = 100;
global.walking_route_down_right_100[1, 0] = 100;
global.walking_route_down_right_100[1, 1] = 100;
global.walking_route_down_right_100[2, 0] = 0;
global.walking_route_down_right_100[2, 1] = 100;

global.walking_route_circle_100[0, 0] = 100;
global.walking_route_circle_100[0, 1] = 0;
global.walking_route_circle_100[1, 0] = 100;
global.walking_route_circle_100[1, 1] = 100;
global.walking_route_circle_100[2, 0] = 0;
global.walking_route_circle_100[2, 1] = 100;

global.cam = camera_create_view(0, 0, 704, 528, 0, obj_forward, -1, -1, 300, 300);
global.debug = false;

// --------- Health variables
hp = 50;
hp_max = 50;
hp_init = 50;

// --------- Score stuff
num_collected = 0;

// --------- Tips stuff
tips[0] = @"Wearing a mask, even if your are not displaying symptoms,
is one of the easiest ways for us to reduce the spread of
COVID-19 - BCCDC";
tips[1] = "You should wash your hands for at least 20 seconds - BCCDC";
tips[2] = "You shouldn't touch your face with unwashed hands - BCCDC";
tips[3] = @"If you don't have a disposable tissue available, cough and
sneeze into the crease of your elbow - BCCDC";
tips[4] = @"Did you know Canada Public Health recommends wearing face
coverings when going out in public?";
tips[5] = @"Masks alone won't prevent the spread of COVID-19 but that
doesn't mean  they shouldn't be used. - Canada Public Health";
tips[6] = @"In addition to staying at least 6ft from others, social 
distancing means avoiding crowds altogether.";
tips[7] = @"As of July 27th 2020, there were over 16.3M confirmed COVID-19
cases worldwide - WHO";
tips[8] = @"Worldwide, the daily confirmed COVID-19 cases are still 
increasing - WHO";

covid_tip_index = random(array_length_1d(tips) - 1);
tip = 0;
covid_tip_title = "COVID-19 - Facts & Safety Tips";

// --------- Transition stuff
level_text = "";
// The amount of time between levels to keep black
level_sleep_steps = 0;
play_sound = false;

// --------- DONE!
room_goto(rm_menu);

level_names[0] = "Tutorial 1: COVID Grocery Run";
level_names[1] = "Level 1: 2020: A COVID Odyssey";
level_names[2] = "Level 2: COVID Go Round";
level_names[3] = "Tutorial 2: Run COVID Run";
level_names[4] = "Level 3: The Social Distancing Network";
level_names[5] = "Tutorial 3: Mask Wearing";
level_names[6] = "Level 4: The Mask";
level_names[7] = "Tutorial 4: Hand Washing";
level_names[8] = "Level 5: The Sound of COVID";
level_names[9] = "Level 6: Don't Catch Me If You Can"; // Do you even wash your hands?
level_names[10] = "Level 7: The COVID Sense";
