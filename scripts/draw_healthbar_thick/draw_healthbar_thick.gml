function draw_healthbar_thick(x1, y1, width, height, thickness, c_color, percentage)
{
	var c = draw_get_color();
	var half = thickness / 2;
	
	draw_set_color(c_black);
	draw_rectangle(x1 - half, y1 - half, x1 + half + width, y1 + half + height, false);
	
	if(percentage > 0) {
		draw_set_color(c_color)
		draw_rectangle(x1, y1, x1 + (width * percentage), y1 + height, false);
	}
	
	draw_set_color(c)
}