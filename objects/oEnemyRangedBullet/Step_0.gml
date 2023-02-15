image_angle += rotation_speed;

// ensure death
time_to_live -= 1;
if(time_to_live <= 0)
{
	image_alpha -= 0.1;
}

if(image_alpha <= 0)
{
	instance_destroy();
}