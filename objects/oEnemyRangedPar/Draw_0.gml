draw_self();

//health bar
var amount = (hitpoints_current / hitpoints_max);
draw_healthbar_thick(x - 32, y - healthbar_padding, healthbar_width, healthbar_height, 2, make_color_rgb(255, 0, 64), amount);