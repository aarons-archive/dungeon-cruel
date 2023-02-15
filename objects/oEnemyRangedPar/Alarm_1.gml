if(state != STATES.hit)
{
	image_speed = 1;
	posNx = x + random_range(-96, 96);
	
	// check wall x
	if(collision_line(x, y, posNx, y, oSolid, false, true))
	{
		posNx = x;
	}
	
	// check wall y
	if(collision_line(x, y, x, posNy, oSolid, false, true))
	{
		posNy = y;
	}
}
