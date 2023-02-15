randomize();

state = STATES.moving;

hitpoints_max = 5;
hitpoints_current = hitpoints_max;
hitpoints_next = hitpoints_current;

//ATACKING
attack_radius = 200;
attack_rate = room_speed * 0.5;
attack_is_possible = true;

//Moving
posNy = y;
posNx = x;

//GUI shit
healthbar_padding = 16;
healthbar_height = 2;
healthbar_width = 64;

// used to find player
target = noone;

//random starting range
image_index = irandom_range(0, image_number - 1);

