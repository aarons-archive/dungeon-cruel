//Setup xx/yy for knight h
xx = 150;
yy = 100;
//Setup xx/yy for skele h
xx2 = 1650;
yy2 = 100;

// KNIGHT HEALTH
//draw red bar
draw_sprite(sHealthBarKnight, 0, xx, yy);
//draw yellow bar
draw_sprite_ext(sHealthBarKnight, 2, xx, yy, xscaleYellow, 1, 0, c_white, 1);	
//draw Green bar
draw_sprite_ext(sHealthBarKnight, 1, xx, yy, xscaleGreen, 1, 0, c_white, 1);
//draw Border
draw_sprite(sHealthBarKnight, 3, xx, yy);


// SKELE HEALTH
//draw red bar
draw_sprite(sHealthBarSkele, 0, xx2, yy2);
//draw yellow bar
draw_sprite_ext(sHealthBarSkele, 2, xx2, yy2, xscaleYellow, 1, 0, c_white, 1);	
//draw Green bar
draw_sprite_ext(sHealthBarSkele, 1, xx2, yy2, xscaleGreen, 1, 0, c_white, 1);
//draw Border
draw_sprite(sHealthBarSkele, 3, xx2, yy2);
